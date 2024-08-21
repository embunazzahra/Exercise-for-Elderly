//
//  AlertView.swift
//  belajarWatchConnectivity Watch App
//
//  Created by Dhau Embun Azzahra on 18/08/24.
//

import SwiftUI

struct AlertPopupView: View {
    // Properties for customizing the popup
    let message: String
    let buttonText: String
    let onButtonTapped: () -> Void
    
    var body: some View {
        VStack {
            Text(message)
                .font(.headline)
                .padding()
            
            Button(action: {
                onButtonTapped()
            }) {
                Text(buttonText)
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
        .background(Color.black.opacity(0.6))
        .cornerRadius(15)
        .padding()
    }
}

