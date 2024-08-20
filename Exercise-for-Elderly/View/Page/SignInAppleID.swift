//
//  SignInAppleID.swift
//  Exercise-for-Elderly
//
//  Created by Jasmine Mutia Alifa on 16/08/24.
//

import SwiftUI
import HealthKit

struct SignInAppleID: View {
    @ObservedObject var viewModel: HealthUserDataViewModel
    
    var body: some View {
        @EnvironmentObject var healthUserDataViewModel: HealthUserDataViewModel
        
        NavigationView{
            VStack(alignment: .leading, spacing: 20) {
                // Title
                Text("Sign Up")
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                    .padding(.leading)
                    .padding(.top, 100)
                        
                // Description
                Text("We’ll help you create an account in a few easy steps using your Apple ID.")
                    .font(.body)
                    .padding(.horizontal)
                
                Spacer()
             
                // Sign Up with Apple button
                NavigationLink(destination: ShowAgeInformation(viewModel: HealthUserDataViewModel(healthStore: HKHealthStore()))
                ) {
                    HStack(spacing: 20) {
                        Image(systemName: "applelogo")
                            .font(.title)
                                        
                        Text("Sign Up with Apple")
                            .font(.title3)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                }
                .padding(.bottom, 250)
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
     
    }
    
}

#Preview {
    SignInAppleID(viewModel: HealthUserDataViewModel(healthStore: HKHealthStore()))
}



