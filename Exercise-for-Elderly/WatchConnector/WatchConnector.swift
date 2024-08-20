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
            if let text = message["text"] as? String {
                self.receivedMessage = text
                print("Message received: \(text)")
            }
        }
    }
    
    func sendDataToWatch() {
        print("send data to watch..")
        if sessions.isReachable {
            let message = ["text": "mantab"] // Mengirim pesan "mantab" ke Watch
            sessions.sendMessage(message, replyHandler: nil)
            print("Sent 'mantab' to watch")
        } else {
            print("Session is not reachable")
        }
    }
}
