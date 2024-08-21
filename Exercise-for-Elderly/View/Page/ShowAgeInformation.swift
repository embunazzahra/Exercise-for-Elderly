//
//  ShowAgeInformation.swift
//  Exercise-for-Elderly
//
//  Created by Jasmine Mutia Alifa on 16/08/24.
//

import SwiftUI
import HealthKit

struct ShowAgeInformation: View {
    @ObservedObject var viewModel: HealthUserDataViewModel

    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .edgesIgnoringSafeArea(.all)
                Image("heart")
                    .padding(.bottom, 150)
                
                VStack(alignment: .center, spacing: 20) {
                    // Title
                    Text("Your Ideal Heart Rate")
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                        .padding(.top, 100)
                        .padding(.bottom, 100)
                            
                    Spacer()
                    
                    // Heart Rate Range
                    if let idealHeartRateRange = viewModel.idealHeartRateRange {
                        Text(idealHeartRateRange)
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                            .foregroundColor(.teal)
                            .padding(.bottom, 20)
                    }
                    
                    // Heart Rate Description
                    if let maxHeartRate = viewModel.maxHeartRate {
                        Text("Your ideal heart rate is between \(viewModel.idealHeartRateRange ?? "") with a maximum heart rate of \(Int(maxHeartRate)) BPM. Stay within these ranges.")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    
                    // Next Button
                    NavigationLink(
                        destination: MenuPage(healthVM: HealthUserDataViewModel(healthStore: HKHealthStore()))
                    ) {
                        ButtoniOS(text: "Next", isPressed: true)
                            .padding(.top, 20)
                            .padding(.bottom, 90)
                    }
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ShowAgeInformation(viewModel: HealthUserDataViewModel(healthStore: HKHealthStore()))
}



