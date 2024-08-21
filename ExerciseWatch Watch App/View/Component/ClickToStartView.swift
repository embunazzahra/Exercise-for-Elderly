//
//  ClickToStartView.swift
//  belajarWatchConnectivity Watch App
//
//  Created by Dhau Embun Azzahra on 18/08/24.
//

import SwiftUI

struct ClickToStartView: View {
    @Binding var hasStarted: Bool
    
    var body: some View {
        VStack {
            VStack {
                CircularTextView(text: "Klik untuk Mulai", diameter: 120, color: Color.tosca)
                    .onTapGesture {
                        hasStarted = true
                    }
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(
                stops: [
                    Gradient.Stop(color: .black, location: 0.00),
                    Gradient.Stop(color: Color(red: 0, green: 0.79, blue: 0.9), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .ignoresSafeArea() // Ensures the gradient fills the entire screen
        )
    }
}

#Preview {
    MainView()
}

