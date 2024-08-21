//
//  ClickToStartView.swift
//  belajarWatchConnectivity Watch App
//
//  Created by Dhau Embun Azzahra on 18/08/24.
//

import SwiftUI

struct ClickToStartView: View {
    @Binding var hasStarted: Bool
    
    var body: some View {
        VStack {
            CircularTextView(text: "Klik untuk Mulai", diameter: 120, color: Color.tosca)
                .onTapGesture {
                    hasStarted = true
                }
        }
    }
}

