//
//  EventController.swift
//  Exercise-for-Elderly
//
//  Created by Dhau Embun Azzahra on 12/08/24.
//

import SwiftUI
import CloudKit

//class EventController: ObservableObject {
//    @Published private(set) var events: [Event] = []
//    private let dataSource: CloudKitService
//    
//    init(dataSource: CloudKitService) {
//        self.dataSource = dataSource
//        fetchEvents()
//    }
//    
//    func fetchEvents() {
//        print("fetch events")
//        //example
//         self.events = dataSource.fetchEvents()
//    }
//    
//    func addEvent(event: Event) {
//        // self.events = dataSource.addEvent()
//        let newEvent = dataSource.addEvent()
//        self.events.insert(newEvent, at: 0)
//        print("add events")
//    }
//    
//}
