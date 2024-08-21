//
//  bpmViewVM.swift
//  ExerciseWatch Watch App
//
//  Created by Hans Zebua on 21/08/24.
//

import SwiftUI
import WatchKit

class BpmViewModel: ObservableObject {
    
    // Set the initial alert type
    @Published var bpmState: AlertType = .ok
    
    // Control the visibility of the popup message
    @Published var showAlertPopup: Bool = false
    
    @Published var isPressed: Bool = false
    
    // Timer to trigger haptic feedback
    private var hapticTimer: Timer? = nil
    
    func updateBpmState(newHeartRate: Double) {
        if newHeartRate >= 100 {
            if !isPressed {
                showAlertPopup = true
                startHapticFeedback()
            }
            bpmState = .alert
        } else {
            bpmState = .ok
            isPressed = false
        }
    }
    
    func turnOffAlert() {
        showAlertPopup = false
        stopHapticFeedback()
        isPressed = true
    }
    
    // Start haptic feedback
    private func startHapticFeedback() {
        stopHapticFeedback() // Ensure any existing timer is canceled before starting a new one
        hapticTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            WKInterfaceDevice.current().play(.failure)
        }
    }
    
    // Stop haptic feedback
    private func stopHapticFeedback() {
        hapticTimer?.invalidate()
        hapticTimer = nil
    }
}

