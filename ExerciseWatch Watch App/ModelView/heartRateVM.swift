//
//  heartRateVM.swift
//  ExerciseWatch Watch App
//
//  Created by Hans Zebua on 19/08/24.
//

import Foundation
import HealthKit

import Foundation
import HealthKit

class HeartRateViewModel: ObservableObject {
    @Published var heartRateModel: HeartRateModel = HeartRateModel(heartRate: 0.0)
    @Published var lastFetchedDate: Date? // New property to store the last fetched date
    
    func startHeartRateQuery() {
        HeartRateManager.shared.startHeartRateQuery { [weak self] samples in
            self?.process(samples)
        }
    }
    
    func stopHeartRateQuery() {
        HeartRateManager.shared.stopHeartRateQuery()
    }
    
    private func process(_ samples: [HKSample]?) {
        guard let samples = samples as? [HKQuantitySample] else {
            return
        }
        
        DispatchQueue.main.async {
            if let lastSample = samples.last {
                self.heartRateModel.heartRate = lastSample.quantity.doubleValue(for: .count().unitDivided(by: .minute())) ?? 0.0
                self.lastFetchedDate = lastSample.startDate // Store the fetch time
            }
        }
    }
}

