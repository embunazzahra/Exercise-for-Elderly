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
                
                
                VStack(alignment: .center, spacing: 20) {
                    Spacer()
                    // Title
                    Text("Detak Jantung Ideal untuk Olahraga")
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
//                        .padding(.top, 100)
//                        .padding(.bottom, 100)
                            
//                    Spacer()
                    Image("heart")
    //                    .padding(.bottom, 150)
                    
                    // Heart Rate Range
                    if let idealHeartRateRange = viewModel.idealHeartRateRange {
                        Text(idealHeartRateRange)
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                            .foregroundColor(.tealcustom)
//                            .padding(.bottom, 20)
                    }
                    
                    // Heart Rate Description
                    if let maxHeartRate = viewModel.maxHeartRate {
                        Text("BPM ideal Anda adalah \(viewModel.idealHeartRateRange ?? "") BPM. Pertahankan dalam rentang ini untuk hasil olahraga yang optimal.")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    
                    // Next Button
                    NavigationLink(
                        destination: MenuPage(healthVM: HealthUserDataViewModel(healthStore: HKHealthStore()))
                    ) {
                        ButtoniOS(text: "Selanjutnya", isPressed: true)
                            .padding(.top, 20)
//                            .padding(.bottom, 90)
                    }
                    Spacer()
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



