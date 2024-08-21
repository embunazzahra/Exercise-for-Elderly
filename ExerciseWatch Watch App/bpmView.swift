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
    @StateObject private var bpmViewModel = BpmViewModel(iosConnector: iOSConnector())
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
                    message: "BPM terlalu tinggi!",
                    buttonText: "Tap to Turn Off",
                    onButtonTapped: {
                        bpmViewModel.turnOffAlert()
                    }
                )
            }
        }
    }
}

#Preview {
    Group {
        bpmView(initialHeartRate: 100)
            .previewDisplayName("State: Alert with Popup")
    }
}







