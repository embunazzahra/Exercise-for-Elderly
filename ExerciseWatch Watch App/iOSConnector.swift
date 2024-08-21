//
//  iOSConnector.swift
//  ExerciseWatch Watch App
//
//  Created by Dhau Embun Azzahra on 20/08/24.
//

import Foundation

import WatchConnectivity

class iOSConnector: NSObject, WCSessionDelegate, ObservableObject {
    var sessions: WCSession
    @Published var receivedMessage: String = ""
    private var bpmViewModel: BpmViewModel?
    
    init(sessions: WCSession = .default) {
        self.sessions = sessions
        super.init()
        sessions.delegate = self
        sessions.activate()
    }
    
    // Function to set the BpmViewModel after initialization
    func setViewModel(_ viewModel: BpmViewModel) {
        self.bpmViewModel = viewModel
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        if let error = error {
            print("Session activation failed with error: \(error.localizedDescription)")
            return
        }
        print("Session activated with state: \(activationState.rawValue)")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            if let type = message["type"] as? String, type == "alert" {
                let name = message["name"] as? String ?? "Unknown"
                let bpm = message["bpm"] as? Int ?? 0
                
                self.receivedMessage = "Alert from \(name): BPM = \(bpm)"
                print("Received alert data: \(message)")
                self.bpmViewModel?.showPopUp(name: name)
            } else {
                print("Unknown message type received: \(message)")
            }
        }
    }
    
    func sendAlertToiOS(name: String, bpm: Int) {
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
    
    func sendStopAlertToiOS() {
        self.receivedMessage = ""
        if sessions.isReachable {
            let message: [String: Any] = [
                "type": "stop_alert"
            ]
            
            sessions.sendMessage(message, replyHandler: nil)
            print("Sent stop alert signal to iOS: \(message)")
        } else {
            print("Session is not reachable")
        }
    }
    
}
