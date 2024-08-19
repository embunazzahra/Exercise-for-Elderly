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

    private var firebaseService = FirebaseService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        firebaseService.$exerciseRoom
            .assign(to: &$exerciseRoom)
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
    
    func joinRoom() {
        Task {
            await withCheckedContinuation { continuation in
                firebaseService.listenForRoomUpdates(inviteCode: inviteCode) { room in
                    if let room = room {
                        self.exerciseRoom = room
                        self.successMessage = "Successfully joined the room!"
                        self.showError = false
                    } else {
                        self.errorMessage = "Room not found or invalid invite code."
                        self.showError = true
                    }
                    continuation.resume()
                }
            }
        }
    }
}

