//
//  bpmView.swift
//  ExerciseWatch Watch App
//
//  Created by Hans Zebua on 19/08/24.
//

import SwiftUI
import WatchKit

struct bpmView: View {
    
    // Initialize the HeartRateViewModel using @StateObject to manage its lifecycle and observe its changes.
    @StateObject private var heartRateViewModel = HeartRateViewModel()
    
    // Set the initial alert type
    @State private var bpmState: AlertType
    
    // Control the visibility of the popup message
    @State private var showAlertPopup: Bool
    
    // Accept heart rate as a parameter to allow preview customization
    let initialHeartRate: Double
    
    // Timer to trigger haptic feedback
    @State private var hapticTimer: Timer? = nil
    
    init(bpmState: AlertType = .ok, showAlertPopup: Bool = false, initialHeartRate: Double = 0) {
        _bpmState = State(initialValue: bpmState)
        _showAlertPopup = State(initialValue: showAlertPopup)
        self.initialHeartRate = initialHeartRate
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack(spacing: heartRateViewModel.heartRateModel.heartRate == 0 ? 0 : 7) {
                    // Display heart rate data or "--" if heart rate data is 0.
                    CircularAlert(alertType: bpmState, person: "Anda", heartRate: Int(heartRateViewModel.heartRateModel.heartRate))
                }
                .frame(width: 172, height: 22, alignment: .center)
                .onAppear {
                    // Set initial heart rate for preview purposes
                    heartRateViewModel.heartRateModel.heartRate = initialHeartRate
                    // Start the heart rate query when the view appears.
                    heartRateViewModel.startHeartRateQuery()
                }
                // Update bpmState based on heart rate changes
                .onChange(of: heartRateViewModel.heartRateModel.heartRate) { newHeartRate in
                    if newHeartRate >= 100 {
                        bpmState = .alert
                        showAlertPopup = true
                        startHapticFeedback()
                    } else {
                        bpmState = .ok
                        showAlertPopup = false
                        stopHapticFeedback()
                    }
                }
            }
            
            if showAlertPopup {
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
                .background(Color.black.opacity(0.6))
                .cornerRadius(15)
                .padding()
            }
        }
    }
    
    // Start haptic feedback
    private func startHapticFeedback() {
        stopHapticFeedback() // Ensure any existing timer is canceled before starting a new one
        hapticTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            WKInterfaceDevice.current().play(.success)
        }
    }
    
    // Stop haptic feedback
    private func stopHapticFeedback() {
        hapticTimer?.invalidate()
        hapticTimer = nil
    }
    
    // Action to turn off the alert popup
    private func turnOffAlert() {
        showAlertPopup = false
        bpmState = .ok
        stopHapticFeedback()
    }
}

#Preview {
    Group {
        bpmView(bpmState: .alert, showAlertPopup: true, initialHeartRate: 100)
            .previewDisplayName("State: Alert with Popup")
    }
}




