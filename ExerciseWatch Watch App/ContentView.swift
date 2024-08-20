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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("send alert") {
                connector.sendDataToiOS(name: "Embun", bpm: 80)
            }
            Text("Received: \(connector.receivedMessage)")
                            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
