//
//  bpmView.swift
//  ExerciseWatch Watch App
//
//  Created by Hans Zebua on 19/08/24.
//

import SwiftUI

struct bpmView: View {
    
    // Initialize the HeartRateViewModel using @StateObject to manage its lifecycle and observe its changes.
    @StateObject private var heartRateViewModel = HeartRateViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: heartRateViewModel.heartRateModel.heartRate == 0 ? 0 : 7) {
                // Display heart rate data or "--" if heart rate data is 0.
                Text(heartRateViewModel.heartRateModel.heartRate == 0 ? "--" : "\(Int(heartRateViewModel.heartRateModel.heartRate))")
                    .font(.system(size: 33))
                    .fontWeight(.medium)
                    .frame(width: heartRateViewModel.heartRateModel.heartRate == 0 ? 25 : 50, height: 22)
                
                HStack(spacing: 1) {
                    // Display the text "BPM".
                    Text("BPM")
                        .font(.system(size: 33))
                        .fontWeight(.medium)
                        .kerning(0.5)
                        .foregroundColor(.white)
                    
                    // Display the text "BPM".
                    Image(systemName: "heart.fill")
                        .font(.system(size: 20))
                        .kerning(0.5)
                        .foregroundColor(.red)
                        .frame(width: 24, height: 22)
                        .opacity(0.98)
                }
            }
            .frame(width: 172, height: 22, alignment: .center)
            // Perform actions when the view appears.
            .onAppear {
                // Start the heart rate query when the view appears.
                heartRateViewModel.startHeartRateQuery()
            }
        }
    }
}

#Preview {
    bpmView()
}
