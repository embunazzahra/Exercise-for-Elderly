//
//  Event.swift
//  Exercise-for-Elderly
//
//  Created by Dhau Embun Azzahra on 12/08/24.
//

import CloudKit

final class Event {
    let record: String
    let recordID: Int
    var eventName: String
    var date: Date
    var location: String
    var createdBy: User
    var membersJoined: [User]
    
    
    init(record: String, recordID: Int, eventName: String, date: Date, location: String, createdBy: User, membersJoined: [User]) {
        self.record = record
        self.recordID = recordID
        self.eventName = eventName
        self.date = date
        self.location = location
        self.createdBy = createdBy
        self.membersJoined = membersJoined
    }
}
