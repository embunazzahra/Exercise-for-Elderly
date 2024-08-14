//
//  ContentView.swift
//  Exercise-for-Elderly
//
//  Created by Dhau Embun Azzahra on 12/08/24.
//

import SwiftUI
//
//struct ContentView: View {
//    @EnvironmentObject var viewModelFactory: ViewModelFactory
//    @ObservedObject var viewModel: CreateEventViewModel
//    
//    
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//            Text("the events \(viewModel.events.isEmpty)")
//            Button(action: {
//                viewModel.createNewEvent(event: Event(
//                    record: "record dummy",
//                    recordID: 2,
//                    eventName: "Sample Event",
//                    date: Date(),  // Use the current date or a specific date
//                    location: "Sample Location",
//                    createdBy: User(
//                        record: "dummyRecord",
//                        recordID: 7,
//                        username: "dummyUsername",
//                        email: "dummyEmail",
//                        createdEvent: []
//                    ),
//                    membersJoined: []  // You can add more dummy users if needed
//                ))
//            }, label: {
//                Text("add event")
//            })
//            List(viewModel.events, id: \.recordID) { event in
//                Text(event.eventName)
//            }
//            .onAppear {
//                viewModel.eventController.fetchEvents()
//            }
//        }
//        .padding()
//    }
//}
//
////#Preview {
////    ContentView(viewModel: ViewModelFactory().makeCreateEventViewModel())
////}

