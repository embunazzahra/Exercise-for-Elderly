//
//  ContentView.swift
//  ExerciseWatch Watch App
//
//  Created by Dhau Embun Azzahra on 18/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var watchConnector = iOSConnector()
    @State var receivedText = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("send Hi to iphone", action: watchConnector.sendDataToiOS)
            Text("Received: \(watchConnector.receivedMessage)")
                            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
