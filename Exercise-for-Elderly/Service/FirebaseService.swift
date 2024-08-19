//
//  FirebaseService.swift
//  Exercise-for-Elderly
//
//  Created by Dhau Embun Azzahra on 18/08/24.
//

import Foundation
import FirebaseFirestore
import Combine


class FirebaseService: ObservableObject {
    @Published var exerciseRoom: ExerciseRoom?
    private var db = Firestore.firestore()
    private var listener: ListenerRegistration?
    private var activeListeners = Set<String>() // Track active listeners
    
    func listenForRoomUpdates(inviteCode: String, completion: @escaping (ExerciseRoom?) -> Void) {
        listener?.remove() // Remove any existing listener
        listener = db.collection("ExerciseRoom")
            .whereField("inviteCode", isEqualTo: inviteCode)
            .limit(to: 1) // We expect only one document
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error fetching snapshot: \(error)")
                    completion(nil)
                    return
                }
                let room = snapshot?.documents.compactMap { document in
                    try? document.data(as: ExerciseRoom.self)
                }.first
                self.exerciseRoom = room
                completion(room)
                
                // Check if the user is already listening to this room
                if !self.activeListeners.contains(inviteCode) {
                    // User is not currently listening, so increment the count
                    self.updateListenerCount(inviteCode: inviteCode, increment: true)
                    // Add to active listeners
                    self.activeListeners.insert(inviteCode)
                }
            }
    }
    
    func stopListeningForRoomUpdates(inviteCode: String) {
        listener?.remove()
        // Update listener count to decrement
        updateListenerCount(inviteCode: inviteCode, increment: false)
    }
    
    private func updateListenerCount(inviteCode: String, increment: Bool) {
        let query = db.collection("ExerciseRoom")
            .whereField("inviteCode", isEqualTo: inviteCode)
            .limit(to: 1)
        
        query.getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching document: \(error.localizedDescription)")
                return
            }
            
            guard let document = snapshot?.documents.first else {
                print("Document not found")
                return
            }
            
            let documentRef = document.reference
            
            documentRef.updateData([
                "usersCount": increment ? FieldValue.increment(Int64(1)) : FieldValue.increment(Int64(-1))
            ]) { error in
                if let error = error {
                    print("Error updating listener count: \(error.localizedDescription)")
                }
            }
        }
    }
    
    
    
    func createNewRoom() async -> Result<ExerciseRoom, Error> {
        await withCheckedContinuation { continuation in
            generateUniqueInviteCode { inviteCode, error in
                if let error = error {
                    continuation.resume(returning: .failure(error))
                    return
                }
                
                guard let inviteCode = inviteCode else {
                    continuation.resume(returning: .failure(NSError(domain: "GenerateCodeError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to generate unique invite code"])))
                    return
                }
                
                let newRoom = ExerciseRoom(
                    createdAt: Timestamp(date: Date()), inviteCode: inviteCode,
                    isAlertOn: false, usersCount: 0
                )
                
                do {
                    _ = try self.db.collection("ExerciseRoom").addDocument(from: newRoom)
                    self.exerciseRoom = newRoom
                    continuation.resume(returning: .success(newRoom))
                } catch {
                    continuation.resume(returning: .failure(error))
                }
            }
        }
    }
    
    private func generateUniqueInviteCode(completion: @escaping (String?, Error?) -> Void) {
        let collectionRef = db.collection("ExerciseRoom")
        
        func generateRandomCode() -> String {
            return String(format: "%04d", Int.random(in: 1000..<10000))
        }
        
        func checkCode(code: String) {
            collectionRef.whereField("inviteCode", isEqualTo: code).getDocuments { (querySnapshot, error) in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                if querySnapshot?.isEmpty == true {
                    completion(code, nil)
                } else {
                    let newCode = generateRandomCode()
                    checkCode(code: newCode)
                }
            }
        }
        
        let initialCode = generateRandomCode()
        checkCode(code: initialCode)
    }
    
    deinit {
        listener?.remove() // Remove listener when service is deallocated
    }
}
