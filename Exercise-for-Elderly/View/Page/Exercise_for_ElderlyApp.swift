//
//  Exercise_for_ElderlyApp.swift
//  Exercise-for-Elderly
//
//  Created by Dhau Embun Azzahra on 12/08/24.
//

//import SwiftUI
//import Firebase
//import HealthKit
////
//@main
//struct Exercise_for_ElderlyApp: App {
//    
//    // Register AppDelegate for Firebase setup
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    
//    private let healthStore: HKHealthStore
//    
//    init() {
//        guard HKHealthStore.isHealthDataAvailable() else { fatalError("This app requires a device that supports HealthKit") }
//        healthStore = HKHealthStore()
//        requestAuthorization()
//    }
//    
//    func requestAuthorization() {
//        let typesToShare: Set<HKSampleType> = Set([
//            HKObjectType.quantityType(forIdentifier: .heartRate)!
//        ])
//        
//        let typesToRead: Set<HKObjectType> = Set([
//            HKObjectType.quantityType(forIdentifier: .heartRate)!, HKSampleType.characteristicType(forIdentifier: .dateOfBirth)!
//        ])
//
//        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
//            if success {
//                // User has granted permission, you can now read/write HealthKit data
//            } else {
//                // Authorization failed or user denied access
//                if let error = error {
//                    print("Authorization failed: \(error.localizedDescription)")
//                }
//            }
//        }
//    }
//    
//    
//    var body: some Scene {
//        WindowGroup {
//            SignInAppleID().environmentObject(healthStore)
//        }
//    }
//}
//
//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication,
//                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Configure Firebase
//        FirebaseApp.configure()
//        
//        // Optional: Set up other services or configurations
//        return true
//    }
//    
//    // Optional: Handle other app delegate methods if needed
//    func application(_ application: UIApplication,
//                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        // Handle registration for remote notifications, e.g., for push notifications
//    }
//}
//
//extension HKHealthStore: ObservableObject {}
import SwiftUI
import Firebase
import HealthKit

@main
struct Exercise_for_ElderlyApp: App {
    
    // Register AppDelegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    private let healthStore: HKHealthStore
    @StateObject private var healthUserDataViewModel = HealthUserDataViewModel(healthStore: HKHealthStore())
        
        init() {
            guard HKHealthStore.isHealthDataAvailable() else { fatalError("This app requires a device that supports HealthKit") }
            healthStore = HKHealthStore()
            requestAuthorization()
        }
        
        func requestAuthorization() {
            let typesToShare: Set<HKSampleType> = Set([
                HKObjectType.quantityType(forIdentifier: .heartRate)!
            ])
            
            let typesToRead: Set<HKObjectType> = Set([
                HKObjectType.quantityType(forIdentifier: .heartRate)!, HKSampleType.characteristicType(forIdentifier: .dateOfBirth)!,
            ])

            healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
                if success {
                    // User has granted permission, you can now read/write HealthKit data
                } else {
                    // Authorization failed or user denied access
                    if let error = error {
                        print("Authorization failed: \(error.localizedDescription)")
                    }
                }
            }
        }

    
    var body: some Scene {
        WindowGroup {
//            SignInAppleID(viewModel: HealthUserDataViewModel(healthStore: healthStore))
            SignInAppleID(viewModel: HealthUserDataViewModel(healthStore: HKHealthStore()))
//                .environmentObject(HealthUserDataViewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Configure Firebase
        FirebaseApp.configure()
        
        // Optional: Set up other services or configurations
        return true
    }
    
    // Optional: Handle other app delegate methods if needed
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Handle registration for remote notifications, e.g., for push notifications
    }
}

extension HKHealthStore: ObservableObject {}
