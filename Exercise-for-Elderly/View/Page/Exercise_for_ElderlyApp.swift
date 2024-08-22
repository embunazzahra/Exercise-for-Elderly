import SwiftUI
import Firebase
import HealthKit
import SwiftData

@main
struct Exercise_for_ElderlyApp: App {
    // Register AppDelegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    // Create the model container as an environment object
    private let modelContainer: ModelContainer
    
    private let healthStore: HKHealthStore
    
    @State private var isHealthAuthorized = false
    
    @StateObject private var healthUserDataViewModel = HealthUserDataViewModel(healthStore: HKHealthStore())
    
    init() {
        guard HKHealthStore.isHealthDataAvailable() else { fatalError("This app requires a device that supports HealthKit") }
        // Initialize the model container with schema
        self.modelContainer = try! ModelContainer(for: UserDataModel.self)
        
        // Set up HealthStore
        self.healthStore = HKHealthStore()
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
                // User has granted permission, try to fetch date of birth
                self.fetchDateOfBirth()
            } else {
                // Authorization failed or user denied access
                if let error = error {
                    print("Authorization failed: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func fetchDateOfBirth() {
        do {
            let birthDate = try healthStore.dateOfBirthComponents()
            print("Fetched Date of Birth: \(birthDate)")
            self.isHealthAuthorized = true // Proceed to InputName if everything is fine
        } catch {
            print("Failed to fetch date of birth: \(error.localizedDescription)")
            self.isHealthAuthorized = false // Stay on FirstPage if fetching date of birth fails
        }
    }
  
    
    var body: some Scene {
        WindowGroup {
            Group {
                if isHealthAuthorized {
                    InputName().modelContainer(modelContainer)
                } else {
                    FirstPage()
                }
            }
            .onAppear {
                requestAuthorization()
                print("Requesting authorization...")
            }
        }
        
        
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication,
                         didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Configure Firebase
            FirebaseApp.configure()
            return true
        }
    }
}
