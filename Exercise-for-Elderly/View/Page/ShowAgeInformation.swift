//
//  ShowAgeInformation.swift
//  Exercise-for-Elderly
//
//  Created by Jasmine Mutia Alifa on 16/08/24.
//


import SwiftUI

struct ShowAgeInformation: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                // Title
                Text("Your Ideal Heart Rate")
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                    .padding(.top, 100)
                    .padding(.bottom, 100)
                        
                Spacer()
                
                // Heart Rate Range
                Text("83 - 140 BPM")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                    .foregroundColor(.teal)
                    .padding(.bottom, 20)
                
                // Heart Rate Description
                Text("Your ideal heart rate is between 83 to 140 beats per minute with a maximum heart rate of 165 BPM. Stay within these ranges.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                
                // Next Button
//                NavigationLink(destination: PasswordPage()
//                ){
//                    Text("Next")
//                        .font(.system(size: 22))
//                        .fontWeight(.semibold)
//                        .frame(maxWidth: 274)
//                        .padding()
//                        .background(Color.teal)
//                        .foregroundColor(.white)
//                        .cornerRadius(50)
//                }
                ButtoniOS(text: "Next", isPressed: true)
                .padding(.top, 20)
                .padding(.bottom, 90)
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ShowAgeInformation()
}
