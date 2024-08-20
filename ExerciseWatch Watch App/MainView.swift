//
//  MainView.swift
//  belajarWatchConnectivity Watch App
//
//  Created by Dhau Embun Azzahra on 18/08/24.
//

import SwiftUI

struct MainView: View {
    @State private var hasStarted: Bool = false
    
    var body: some View {
        Group {
            if hasStarted {
               bpmView()
            } else {
                ClickToStartView(hasStarted: $hasStarted)
            }
        }
    }
}

#Preview {
    MainView()
}
