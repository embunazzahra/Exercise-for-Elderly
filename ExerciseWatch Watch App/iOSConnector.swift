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
    
    init(sessions: WCSession = .default) {
        self.sessions = sessions
        super.init()
        sessions.delegate = self
        sessions.activate()
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
            if let text = message["text"] as? String {
                self.receivedMessage = text
                print("Message received: \(text)")
            }
        }
    }
    
    func sendDataToiOS() {
        if sessions.isReachable {
            let message = ["text": "hai"] // Wrap your string in a dictionary
            sessions.sendMessage(message, replyHandler: nil)
            print("pen send data deh")
        }
        else {
            print("session is not reachable")
        }
    }
    
}
