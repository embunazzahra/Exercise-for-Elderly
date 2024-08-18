//
//  CreateEventViewModel.swift
//  Exercise-for-Elderly
//
//  Created by Dhau Embun Azzahra on 12/08/24.
//

//import Foundation
//import Combine
//
//internal class CreateEventViewModel: ObservableObject {
//    var eventController: EventController
//    @Published var events: [Event] = []
//    
//    private var cancellables = Set<AnyCancellable>()
//    
//    init(eventController: EventController) {
//        self.eventController = eventController
//        self.events = eventController.events
//        
//        // untuk memantau perubahan data events pada note controller
//        eventController.$events.sink { [weak self] in
//                    self?.events = $0
//                }
//                .store(in: &cancellables)
//    }
//    
//    //example
//    func createNewEvent(event: Event) {
//        eventController.addEvent(event: Event(
//            record: "record dummy",
//            recordID: 2,
//            eventName: "Sample Event",
//            date: Date(),  // Use the current date or a specific date
//            location: "Sample Location",
//            createdBy: User(
//                record: "dummyRecord",
//                recordID: 3,
//                username: "dummyUsername",
//                email: "dummyEmail",
//                createdEvent: []
//            ),
//            membersJoined: []  // You can add more dummy users if needed
//        ))
//    }
//}
