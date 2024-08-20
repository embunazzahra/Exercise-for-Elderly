//
//  HealthUserData.swift
//  Exercise-for-Elderly
//
//  Created by Jasmine Mutia Alifa on 20/08/24.
//

import SwiftUI
import HealthKit

class HealthUserDataViewModel: ObservableObject {
    @Published var heartRate: Double = 0.0
    @Published var age: Int?
    @Published var maxHeartRate: Double?
    @Published var idealHeartRateRange: String?

    private var healthStore: HKHealthStore
    
    init(healthStore: HKHealthStore) {
        self.healthStore = healthStore
        startHeartRateQuery()
        fetchDateOfBirthAndAge()
    }

    private func startHeartRateQuery() {
        guard let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate) else {
            print("Heart rate type is not available.")
            return
        }

        let query = HKAnchoredObjectQuery(
            type: heartRateType,
            predicate: nil,
            anchor: nil,
            limit: HKObjectQueryNoLimit
        ) { query, samples, deletedObjects, newAnchor, error in
            self.updateHeartRate(with: samples)
        }

        query.updateHandler = { query, samples, deletedObjects, newAnchor, error in
            self.updateHeartRate(with: samples)
        }

        healthStore.execute(query)
    }

    private func updateHeartRate(with samples: [HKSample]?) {
        guard let heartRateSamples = samples as? [HKQuantitySample] else { return }
        
        DispatchQueue.main.async {
            if let latestSample = heartRateSamples.first {
                self.heartRate = latestSample.quantity.doubleValue(for: HKUnit(from: "count/min"))
            }
        }
    }

    private func fetchDateOfBirthAndAge() {
        do {
            let dateComponents = try healthStore.dateOfBirthComponents()
            DispatchQueue.main.async {
                if let age = self.calculateAge(from: dateComponents) {
                    self.age = age
                    self.maxHeartRate = self.calculateMaxHeartRate(for: age)
                    self.idealHeartRateRange = self.calculateDynamicHeartRateRange(for: age)
                }
            }
        } catch {
            print("Failed to fetch date of birth: \(error.localizedDescription)")
        }
    }

    private func calculateAge(from dateComponents: DateComponents) -> Int? {
        guard let birthDate = Calendar.current.date(from: dateComponents) else { return nil }
        let ageComponents = Calendar.current.dateComponents([.year], from: birthDate, to: Date())
        return ageComponents.year
    }

    private func calculateMaxHeartRate(for age: Int) -> Double {
        return 206.9 - (0.67 * Double(age))
    }
    
    private func calculateDynamicHeartRateRange(for age: Int) -> String {
            guard let maxHR = maxHeartRate else { return "Unknown" }
            let lowerBound = 0.50 * maxHR
            let upperBound = 0.85 * maxHR
            return String(format: "%.0f-%.0f BPM", lowerBound, upperBound)
    }
}


