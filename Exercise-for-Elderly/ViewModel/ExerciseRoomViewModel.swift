//
//  ExerciseRoomViewModel.swift
//  Exercise-for-Elderly
//
//  Created by Dhau Embun Azzahra on 18/08/24.
//

import Foundation
import Combine

@MainActor
class ExerciseRoomViewModel: ObservableObject {
    @Published var exerciseRoom: ExerciseRoom?
    @Published var inviteCode: String = ""
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    @Published var successMessage: String = ""
    @Published var isLoading: Bool = false
    private let watchConnector = WatchConnector()
    
    private var firebaseService = FirebaseService()
    private var cancellables = Set<AnyCancellable>()
    
    // Property to track if the alert data has been sent
    private var hasSentAlert = false
    
    init() {
        watchConnector.setViewModel(self)
        
        firebaseService.$exerciseRoom
            .sink { [weak self] room in
                self?.exerciseRoom = room
                self?.handleRoomUpdate(room)
            }
            .store(in: &cancellables)
        //        firebaseService.$exerciseRoom
        //            .assign(to: &$exerciseRoom)
        
        print("view model watching the exercise room..")
    }
    
    func generateInviteCode(completion: @escaping () -> Void) {
        Task {
            let result = await firebaseService.createNewRoom()
            switch result {
            case .success(let room):
                self.exerciseRoom = room
                self.inviteCode = room.inviteCode
                self.successMessage = "Invite code generated successfully!"
                self.showError = false
            case .failure(let error):
                self.errorMessage = "Error generating invite code: \(error.localizedDescription)"
                self.showError = true
            }
            completion()
        }
    }
    
    func joinRoom(completion: @escaping () -> Void) {
        // Show loading indicator before starting
        isLoading = true
        
        firebaseService.listenForRoomUpdates(inviteCode: inviteCode) { [weak self] room in
            guard let self = self else { return }
            
            if let room = room {
                // Update the view model with the room details
                self.exerciseRoom = room
                self.successMessage = "Joined room successfully!"
                self.showError = false
            } else {
                // Handle the error and update the view model
                self.errorMessage = "Error joining room."
                self.showError = true
                print(self.errorMessage)
            }
            
            // Hide loading indicator after completing
            self.isLoading = false
            
            // Notify the view that joining the room is complete
            completion()
        }
    }
    
    func updateIsAlertOn(isAlertOn: Bool) {
        guard !inviteCode.isEmpty else {
            print("No invite code provided")
            return
        }
        
        firebaseService.updateIsAlertOn(inviteCode: inviteCode, isAlertOn: isAlertOn) { [weak self] success in
            guard let self = self else { return }
            if success {
                self.successMessage = "Alert state updated successfully!"
                print(self.successMessage)
            } else {
                self.errorMessage = "Failed to update alert state."
                self.showError = true
                print(self.errorMessage)
            }
        }
    }
    
    // Handle room updates and send data to watch if isAlertOn is true
    private func handleRoomUpdate(_ room: ExerciseRoom?) {
        guard let room = room else { return }
        
        if room.isAlertOn && !hasSentAlert {
            watchConnector.sendDataToWatch(name: "Embun", bpm: 80)
            hasSentAlert = true
        } else if !room.isAlertOn {
            // Reset the flag when isAlertOn becomes false
            hasSentAlert = false
        }
    }
}

