//
//  heartRateManager.swift
//  ExerciseWatch Watch App
//
//  Created by Hans Zebua on 19/08/24.
//

import HealthKit

class HeartRateManager {
    
    static let shared = HeartRateManager()
    private let healthStore = HKHealthStore()
    
    // Reference to the currently running heart rate query.
    private var heartRateQuery: HKAnchoredObjectQuery?

    // Function to start a heart rate query. It takes a completion handler that returns an optional array of HKSample.
    func startHeartRateQuery(completion: @escaping ([HKSample]?) -> Void) {
        
        // To ensure the heart rate type is valid and If not valid, exit the function early.
        guard let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate) else {
            return
        }
        
        // Create a predicate to query samples starting from the current date.
        let predicate = HKQuery.predicateForSamples(withStart: Date(), end: nil, options: .strictStartDate)
        
        // Create an anchored object query to get heart rate samples.
        let query = HKAnchoredObjectQuery(type: heartRateType, predicate: predicate, anchor: nil, limit: HKObjectQueryNoLimit) { (query, samples, deletedObjects, newAnchor, error) in
            completion(samples)
        }
        
        // Set the update handler to be called when new data is available.
        query.updateHandler = { (query, samples, deletedObjects, newAnchor, error) in
            completion(samples)
        }
        
        // Keep a reference to the query so it can be stopped later.
        heartRateQuery = query
        
        // Execute the query on the healthStore.
        healthStore.execute(query)
    }
    
    // Function to stop the heart rate query.
    func stopHeartRateQuery() {
        if let query = heartRateQuery {
            healthStore.stop(query)
            heartRateQuery = nil // Clear the reference after stopping the query
        }
    }
}

