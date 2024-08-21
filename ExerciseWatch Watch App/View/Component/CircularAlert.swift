//
//  CircularAlert.swift
//  belajarWatchConnectivity Watch App
//
//  Created by Dhau Embun Azzahra on 19/08/24.
//

import SwiftUI

struct CircularAlert: View {
    var alertType: AlertType
    var person: String
    var heartRate: Int // Replace BPMNumber with heartRate
        
    var body: some View {
        ZStack{
//            CircularTextView(text: "", diameter: 115, color: alertType.color.opacity(0.9))
//            CircularTextView(text: "", diameter: 153, color: alertType.color.opacity(0.7))
//            CircularTextView(text: "", diameter: 185, color: alertType.color.opacity(0.3))
            Image("heartAsset")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 350, height: 187)
                .clipped()
            VStack {
                Text("Detak Jantung")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.black)
                
                // Modified Text view for BPMNumber
                HStack {
                    Text(heartRate == 0 ? "--" : "\(Int(heartRate))")
                        .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(.black)
                    Text("BPM")
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    Image(systemName: alertType.symbol)
                        .foregroundColor(.black)
                }
                
                HStack(spacing: 0) {
                    Text("x menit lalu")
                        .font(.system(size: 16, weight: .light))
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    CircularAlert(alertType: .ok, person: "Anda", heartRate: 70)
}
