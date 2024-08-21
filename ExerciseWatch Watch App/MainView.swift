//
//  MainView.swift
//  belajarWatchConnectivity Watch App
//
//  Created by Dhau Embun Azzahra on 18/08/24.
//

import SwiftUI

struct MainView: View {
    @State private var hasStarted: Bool = false
    
    // nanti ganti ya mbun
    var hasconnected = true
    var code = "1234"
        
    var body: some View {
        NavigationStack{
            VStack {
                Group {
                    if hasStarted {
                       bpmView()
                    } else {
                        ClickToStartView(hasStarted: $hasStarted, hasConnected: true, code: code)
                    }
                }
            }
        }
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
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainView()
}
