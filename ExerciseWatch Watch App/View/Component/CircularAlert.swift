//
//  CircularAlert.swift
//  belajarWatchConnectivity Watch App
//
//  Created by Dhau Embun Azzahra on 19/08/24.
//

import SwiftUI

struct CircularAlert: View {
    var alertType: AlertType
    var heartRate: Int
    var lastFetchedDate: Date? // Add lastFetchedDate as a parameter
    
    var body: some View {
        ZStack{
            Image("heartAsset")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 350, height: 187)
                .clipped()
            
            VStack {
                Text("Detak Jantung")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.black)
                
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
                    Text(timeAgoSince(lastFetchedDate))
                        .font(.system(size: 16, weight: .light))
                        .foregroundStyle(.black)
                }
            }
            .padding(.bottom, 20)
        }
    }
    
    // Helper function to calculate the time since the last fetch in seconds
    func timeAgoSince(_ date: Date?) -> String {
        guard let date = date else { return "N/A" }
        let secondsAgo = Int(Date().timeIntervalSince(date)) // Calculate difference in seconds
        return "\(secondsAgo) detik lalu" // "detik lalu" means "seconds ago"
    }
}


#Preview {
    CircularAlert(alertType: .ok, heartRate: 70)
}
