//
//  CircularTextView.swift
//  belajarWatchConnectivity Watch App
//
//  Created by Dhau Embun Azzahra on 18/08/24.
//

import SwiftUI

struct CircularTextView: View {
    var text: String
    var diameter: CGFloat
    var color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: diameter, height: diameter)
            
            GeometryReader { geometry in
                Text(text)
                    .font(.system(size: diameter / 5.5))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .minimumScaleFactor(0.5)
                    .frame(width: geometry.size.width, height: geometry.size.height) // Batasan dalam lingkaran
                    .multilineTextAlignment(.center)
            }
            .frame(width: diameter, height: diameter) // Sesuaikan dengan diameter lingkaran
        }
    }
}

#Preview {
    CircularTextView(text: "Klik untuk Mulai", diameter: 120, color: Color.tosca)
}
