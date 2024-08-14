//
//  UserController.swift
//  Exercise-for-Elderly
//
//  Created by Dhau Embun Azzahra on 12/08/24.
//
//import SwiftUI
//import CloudKit
//
//class UserController: ObservableObject {
//    @Published private(set) var user: User?
//    private let dataSource: CloudKitService
//    
//    init(dataSource: CloudKitService) {
//        self.dataSource = dataSource
//        fetchUser()
//    }
//    
//    func fetchUser() {
//        // self.user = dataSource.fetchUser()
//        self.user = User(
//            record: "dummyRecord",
//            recordID: 3,
//            username: "dummyUsername",
//            email: "dummyEmail",
//            createdEvent: []
//        )
//    }
//    
//    func updateUserName(newName: String) {
//        // self.user = dataSource.updateUserName()
//    }
//    
//    
//}
