//
//  AlertType.swift
//  belajarWatchConnectivity Watch App
//
//  Created by Dhau Embun Azzahra on 19/08/24.
//

import Foundation
import SwiftUI

enum AlertType {
    case ok
    case alert
    
    var color: Color {
        switch self {
        case .ok:
            return .green
        case .alert:
            return .red
        }
    }
    
    var text: String {
        switch self {
        case .ok:
            return "OK"
        case .alert:
            return "Alert"
        }
    }
    
    var symbol: String {
        switch self {
        case .ok:
            return "checkmark.circle.fill"
        case .alert:
            return "exclamationmark.triangle"
        }
    }
}
