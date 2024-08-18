//
//  CloudKitService.swift
//  Exercise-for-Elderly
//
//  Created by Dhau Embun Azzahra on 12/08/24.
//

//import Foundation
//import CloudKit


class CloudKitService {
//    
//    static let shared = CloudKitService()
//    
//    private let container: CKContainer
//    private var database: CKDatabase
//    
//    private init(containerIdentifier: String = CKContainer.default().containerIdentifier ?? "") {
//        self.container = CKContainer(identifier: containerIdentifier)
//        self.database = container.publicCloudDatabase  // Default database
//    }
//    
//    // MARK: - Save Record
//    func saveRecord(record: CKRecord, completion: @escaping (Result<CKRecord, Error>) -> Void) {
//        database.save(record) { savedRecord, error in
//            if let error = error {
//                completion(.failure(error))
//            } else if let savedRecord = savedRecord {
//                completion(.success(savedRecord))
//            }
//        }
//    }
//    
//    // MARK: - Fetch Record
//    func fetchRecord(recordID: CKRecord.ID, completion: @escaping (Result<CKRecord, Error>) -> Void) {
//        database.fetch(withRecordID: recordID) { fetchedRecord, error in
//            if let error = error {
//                completion(.failure(error))
//            } else if let fetchedRecord = fetchedRecord {
//                completion(.success(fetchedRecord))
//            }
//        }
//    }
//    
//    // MARK: - Query Records
//    func queryRecords(recordType: String, predicate: NSPredicate = NSPredicate(value: true), completion: @escaping (Result<[CKRecord], Error>) -> Void) {
//        let query = CKQuery(recordType: recordType, predicate: predicate)
//        database.perform(query, inZoneWith: nil) { results, error in
//            if let error = error {
//                completion(.failure(error))
//            } else if let results = results {
//                completion(.success(results))
//            }
//        }
//    }
//    
//    // MARK: - Delete Record
//    func deleteRecord(recordID: CKRecord.ID, completion: @escaping (Result<CKRecord.ID, Error>) -> Void) {
//        database.delete(withRecordID: recordID) { deletedRecordID, error in
//            if let error = error {
//                completion(.failure(error))
//            } else if let deletedRecordID = deletedRecordID {
//                completion(.success(deletedRecordID))
//            }
//        }
//    }
//    
//    // MARK: - Configure for Different Environments
//    func configureDatabase(for environment: CKDatabase.Scope) {
//        switch environment {
//        case .public:
//            self.database = container.publicCloudDatabase
//        case .private:
//            self.database = container.privateCloudDatabase
//        case .shared:
//            self.database = container.sharedCloudDatabase
//        @unknown default:
//            fatalError("Unknown database scope encountered.")
//        }
//    }
//    
//    //CRUD to the database
//    //example
//    func fetchEvents() -> [Event] {
//        print("fetch events in service")
//        //fetch data from database
//        return [Event(
//            record: "record dummy",
//            recordID: 2,
//            eventName: "Sample Event",
//            date: Date(),  // Use the current date or a specific date
//            location: "Sample Location",
//            createdBy: User(
//                record: "dummyRecord",
//                recordID: 3,
//                username: "dummyUsername",
//                email: "dummyEmail",
//                createdEvent: []
//            ),
//            membersJoined: []  // You can add more dummy users if needed
//        )]
//    }
//    
//    //example
//    func addEvent() -> Event {
//        //fetch data from database
//        return Event(
//            record: "record dummy",
//            recordID: 2,
//            eventName: "Sample Event",
//            date: Date(),  // Use the current date or a specific date
//            location: "Sample Location",
//            createdBy: User(
//                record: "dummyRecord",
//                recordID: 3,
//                username: "dummyUsername",
//                email: "dummyEmail",
//                createdEvent: []
//            ),
//            membersJoined: []  // You can add more dummy users if needed
//        )
//    }
}
