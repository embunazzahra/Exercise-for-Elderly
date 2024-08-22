//
//  ClickToStartView.swift
//  belajarWatchConnectivity Watch App
//
//  Created by Dhau Embun Azzahra on 18/08/24.
//

import SwiftUI

struct ClickToStartView: View {
    @Binding var hasStarted: Bool
    var hasConnected: Bool
    var code: String
    
    var body: some View {
        VStack {
            VStack {
                if !hasConnected {
                    CircularTextView(text: "Belum Terhubung", diameter: 120, color: .gray)
                        .opacity(0.8)
                } else {
                    CircularTextView(text: "Klik untuk Mulai", diameter: 120, color: Color.tosca)
                        .onTapGesture {
                            hasStarted = true
                        }
                        .opacity(0.8)
                    Text(code)
                        .frame(width: 60, height: 20)
                        .font(.body)
                        .bold()
                        .background(.teal).cornerRadius(20)
                        .padding(.top, 10)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    MainView()
}

