//
//  heartRateVM.swift
//  ExerciseWatch Watch App
//
//  Created by Hans Zebua on 19/08/24.
//

import Foundation
import HealthKit

class HeartRateViewModel: ObservableObject {
    
    // Declare a published property to hold heart rate data, initializing it with a heart rate of 0.0.
    @Published var heartRateModel: HeartRateModel = HeartRateModel(heartRate: 0.0)
    
    // Define a function to start querying heart rate data.
    func startHeartRateQuery() {
        // Use the shared instance of HeartRateManager to start the query, using the startHeartRateQuery function inside it.
        HeartRateManager.shared.startHeartRateQuery { [weak self] samples in
            // Call the process method to handle the returned samples.
            self?.process(samples)
        }
    }
    
    // Define a function to stop querying heart rate data.
    func stopHeartRateQuery() {
        // Use the shared instance of HeartRateManager to stop the query.
        HeartRateManager.shared.stopHeartRateQuery()
    }
    
    // Define a private function to process the retrieved samples.
    private func process(_ samples: [HKSample]?) {
        // Ensure the samples are of type HKQuantitySample.
        guard let samples = samples as? [HKQuantitySample] else {
            return
        }

        // This code runs on the main thread to update the UI.
        DispatchQueue.main.async {
            // Update the heart rate model with the latest heart rate value, defaulting to 0.0 if no samples are available.
            self.heartRateModel.heartRate = samples.last?.quantity.doubleValue(for: .count().unitDivided(by: .minute())) ?? 0.0
        }
    }
}

