//
//  AlertView.swift
//  belajarWatchConnectivity Watch App
//
//  Created by Dhau Embun Azzahra on 18/08/24.
//

import SwiftUI

struct AlertView: View {
    var turnOffAlert: () -> Void
    
    var body: some View {
        VStack {
            Text("BPM terlalu tinggi!")
                .font(.headline)
                .padding()
            
            Button(action: {
                turnOffAlert()
            }) {
                Text("Tap to Turn Off")
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    AlertView(turnOffAlert: {})
}
