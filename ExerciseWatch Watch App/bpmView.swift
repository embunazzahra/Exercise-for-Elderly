//
//  bpmView.swift
//  ExerciseWatch Watch App
//
//  Created by Hans Zebua on 19/08/24.
//

import SwiftUI
import WatchKit

struct bpmView: View {
    
    @StateObject private var heartRateViewModel = HeartRateViewModel()
    @StateObject private var bpmViewModel = BpmViewModel()
    let initialHeartRate: Double
    
    init(initialHeartRate: Double = 0) {
        self.initialHeartRate = initialHeartRate
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack(spacing: heartRateViewModel.heartRateModel.heartRate == 0 ? 0 : 7) {
                    CircularAlert(alertType: bpmViewModel.bpmState, person: "Anda", heartRate: Int(heartRateViewModel.heartRateModel.heartRate))
                }
                .frame(width: 172, height: 22, alignment: .center)
                .onAppear {
                    heartRateViewModel.heartRateModel.heartRate = initialHeartRate
                    heartRateViewModel.startHeartRateQuery()
                }
                .onChange(of: heartRateViewModel.heartRateModel.heartRate) { newHeartRate in
                    bpmViewModel.updateBpmState(newHeartRate: newHeartRate)
                }
            }
            
            if bpmViewModel.showAlertPopup {
                AlertPopupView(
                    onButtonTapped: {
                        bpmViewModel.turnOffAlert()
                    }
                )
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
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
    Group {
        bpmView(initialHeartRate: 100)
            .previewDisplayName("State: Alert with Popup")
    }
}








