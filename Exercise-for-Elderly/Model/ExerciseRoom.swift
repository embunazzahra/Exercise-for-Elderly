//
//  ExerciseRoom.swift
//  Exercise-for-Elderly
//
//  Created by Dhau Embun Azzahra on 18/08/24.
//

import Foundation
import FirebaseFirestore

struct ExerciseRoom: Identifiable, Codable {
    @DocumentID var id: String? // Firestore document ID
    var createdAt: Timestamp
    var inviteCode: String
    var isAlertOn: Bool // Example field to represent the lamp state
}
