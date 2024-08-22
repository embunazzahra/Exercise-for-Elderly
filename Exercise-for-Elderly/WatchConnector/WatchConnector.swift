//
//  WatchConnector.swift
//  Exercise-for-Elderly
//
//  Created by Dhau Embun Azzahra on 20/08/24.
//

import Foundation
import WatchConnectivity

class WatchConnector: NSObject, WCSessionDelegate, ObservableObject {
    var sessions: WCSession
    var viewModel: ExerciseRoomViewModel?
    @Published var receivedMessage: String = ""
    
    
    init(sessions: WCSession = .default) {
        self.sessions = sessions
        super.init()
        sessions.delegate = self
        sessions.activate()
    }
    
    func setViewModel(_ viewModel: ExerciseRoomViewModel) {
        self.viewModel = viewModel
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        if let error = error {
            print("Session activation failed with error: \(error.localizedDescription)")
            return
        }
        print("Session activated with state: \(activationState.rawValue)")
        switch activationState {
        case .activated:
            print("WCSession activated successfully")
        case .inactive:
            print("Unable to activate the WCSession. Error: \(error?.localizedDescription ?? "--")")
        case .notActivated:
            print("Unexpected .notActivated state received after trying to activate the WCSession")
        @unknown default:
            print("Unexpected state received after trying to activate the WCSession")
        }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            if let type = message["type"] as? String {
                switch type {
                case "alert":
                    let name = message["name"] as? String ?? "Unknown"
                    let bpm = message["bpm"] as? Int ?? 0
                    self.receivedMessage = "Alert from \(name): BPM = \(bpm)"
                    print("Received alert data: \(message)")
                    self.updateAlertStatusFromMessage(message)
                    
                case "stop_alert":
                    print("Received stop alert signal: \(message)")
                    self.receivedMessage = "Stop alert received"
                    self.updateAlertStatusFromMessage(message)
                    
                default:
                    print("Unknown message type received: \(message)")
                }
            } else {
                print("Invalid message format received: \(message)")
            }
        }
    }
    
    func sendAlertToWatch(name: String, bpm: Int) {
        if sessions.isReachable {
            let message: [String: Any] = [
                "type": "alert",
                "name": name,
                "bpm": bpm
            ]
            
            sessions.sendMessage(message, replyHandler: nil)
            print("Sent alert data to iOS: \(message)")
        } else {
            print("Session is not reachable")
        }
    }
    
    func sendUserDataToWatch(name: String, inviteCode: String) {
        if sessions.isReachable {
            let message: [String: Any] = [
                "type": "user_data",
                "name": name,
                "inviteCode": inviteCode
            ]
            
            sessions.sendMessage(message, replyHandler: nil)
            print("Sent user data to watch: \(message)")
        } else {
            print("Session is not reachable")
        }
    }
    
    @MainActor private func updateAlertStatusFromMessage(_ message: [String: Any]) {
        guard let type = message["type"] as? String else { return }
        
        switch type {
        case "alert":
            guard let bpm = message["bpm"] as? Int else { return }
            print("Processing alert message: BPM = \(bpm)")
            // Call the method to update isAlertOn to true in the view model
            viewModel?.updateIsAlertOn(isAlertOn: true)
            print("trying to call viewModel?.updateIsAlertOn....")
            
        case "stop_alert":
            print("Processing stop alert message")
            // Call the method to update isAlertOn to false in the view model
            viewModel?.updateIsAlertOn(isAlertOn: false)
            print("trying to stop viewModel?.updateIsAlertOn....")
            
        default:
            print("Unknown message type received: \(type)")
        }
    }

}
