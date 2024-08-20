//
//  healthkitManager.swift
//  ExerciseWatch Watch App
//
//  Created by Hans Zebua on 19/08/24.
//

import HealthKit

class HealthKitManager: ObservableObject {
    
    let healthStore = HKHealthStore()
    @Published var isAuthorized: Bool = false

    // Function to request HealthKit authorization from the user.
    func requestAuthorization() {
        
        // Check if HealthKit data is available on this device and If not available, exit the function early.
        guard HKHealthStore.isHealthDataAvailable() else {
            return
        }
        
        // Define the types of health data the app wants to read or write.
        let sampleTypesToRead = Set([
            // Request authorization to read heart rate data.
            HKObjectType.quantityType(forIdentifier: .heartRate)!,
        ])
        
        // Request authorization to read or write the specified health data.
        healthStore.requestAuthorization(toShare: nil, read: sampleTypesToRead) { (success, error) in
            // This following code runs on the main thread.
            DispatchQueue.main.async {
                // Check if the authorization request was successful or not.
                if success {
                    self.isAuthorized = true
                } else {
                    self.isAuthorized = false
                }
            }
        }
    }
}
