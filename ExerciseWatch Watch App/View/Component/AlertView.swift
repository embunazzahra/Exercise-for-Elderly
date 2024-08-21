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
    var Person: String
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.9).edgesIgnoringSafeArea(.all)
            VStack {
                
                
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Text(" \(Person) Melebihi detak jantung ideal.")

                    .font(.headline)

                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    onButtonTapped()
                }) {
                    VStack {
                        
                        Text("Tutup")
                            .padding()
                            .multilineTextAlignment(.center)
                    }
                }
                .padding()
                
            }
            .padding()
            .padding(.vertical, 20)
            .ignoresSafeArea()
            .cornerRadius(15)
        }
    }
}

#Preview {
    Group {
        bpmView(initialHeartRate: 100)
            .previewDisplayName("State: Alert with Popup")
    }
}
