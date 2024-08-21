//
//  ContentView.swift
//  ExerciseWatch Watch App
//
//  Created by Dhau Embun Azzahra on 18/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var connector = iOSConnector()
    @State var receivedText = ""
    
    var body: some View {
        VStack {
            Button("send alert") {
                connector.sendAlertToiOS(name: "Embun", bpm: 80)
            }
            Text("Received: \(connector.receivedMessage)")
                            .padding()
            Button("stop alert") {
                connector.sendStopAlertToiOS()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
