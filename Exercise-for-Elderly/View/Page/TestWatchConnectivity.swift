//
//  TestWatchConnectivity.swift
//  Exercise-for-Elderly
//
//  Created by Dhau Embun Azzahra on 20/08/24.
//

import SwiftUI

struct TestWatchConnectivity: View {
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
//            Text("Received message: \(watchConnector.receivedMessage)")
//                .padding()
//            Button("Send 'mantab' to watch") {
//                watchConnector.sendDataToWatch(name: "Embun", bpm: 90)
//            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    TestWatchConnectivity()
}
