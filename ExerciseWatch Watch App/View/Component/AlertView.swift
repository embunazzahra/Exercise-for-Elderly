//
//  AlertView.swift
//  belajarWatchConnectivity Watch App
//
//  Created by Dhau Embun Azzahra on 18/08/24.
//

import SwiftUI

struct AlertPopupView: View {
    // Properties for customizing the popup
    let onButtonTapped: () -> Void
    
    var body: some View {
        VStack {
            
            Text("Melebihi detak jantung ideal")

                .font(.headline)

                .multilineTextAlignment(.center)
                .padding()
            
            Button(action: {
                onButtonTapped()
            }) {
                VStack {
                    
                    Text("Tutup")
                        .foregroundColor(.red)
                        .padding()
                        .multilineTextAlignment(.center)
                }
            }
            .padding()
            
        }
        .ignoresSafeArea()
        .background(Color.black.opacity(1))
        .cornerRadius(15)
        .padding()
    }
}

#Preview {
    Group {
        bpmView(initialHeartRate: 100)
            .previewDisplayName("State: Alert with Popup")
    }
}
