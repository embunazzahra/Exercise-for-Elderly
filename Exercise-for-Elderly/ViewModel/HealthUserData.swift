//
//  HealthUserData.swift
//  Exercise-for-Elderly
//
//  Created by Jasmine Mutia Alifa on 19/08/24.

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
                    self.idealHeartRateRange = self.calculateIdealHeartRateRange(for: age)
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
    
    private func calculateIdealHeartRateRange(for age: Int) -> String {
        switch age {
        case 20...29:
            return "100-170 BPM"
        case 30...34:
            return "95-162 BPM"
        case 35...39:
            return "93-157 BPM"
        case 40...44:
            return "90-153 BPM"
        case 45...49:
            return "88-149 BPM"
        case 50...54:
            return "85-145 BPM"
        case 55...59:
            return "83-140 BPM"
        case 60...64:
            return "80-136 BPM"
        case 65...69:
            return "78-132 BPM"
        case 70...:
            return "75-128 BPM"
        default:
            return "Unknown"
        }
    }
}
