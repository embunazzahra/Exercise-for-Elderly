//
//  User.swift
//  Exercise-for-Elderly
//
//  Created by Dhau Embun Azzahra on 12/08/24.
//

import CloudKit

final class User {
    let record: String
    let recordID: Int
    var username: String
    var email: String
    var createdEvent: [Event]
    
    init(record: String, recordID: Int, username: String, email: String, createdEvent: [Event]) {
        self.record = record
        self.recordID = recordID
        self.username = username
        self.email = email
        self.createdEvent = createdEvent
    }
    
}
