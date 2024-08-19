//
//  ExerciseWatchApp.swift
//  ExerciseWatch Watch App
//
//  Created by Dhau Embun Azzahra on 18/08/24.
//

import SwiftUI

@main
struct ExerciseWatch_Watch_AppApp: App {
    @StateObject private var healthKitManager = HealthKitManager()
        
        var body: some Scene {
            WindowGroup {
                if healthKitManager.isAuthorized {
                    bpmView()
                } else {
                    Text("Requesting Health Data Access...")
                        .onAppear {
                            // Request authorization for HealthKit access when the app launches.
                            healthKitManager.requestAuthorization()
                        }
                }
            }
        }
}
