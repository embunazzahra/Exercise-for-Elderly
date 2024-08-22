//
//  InputName.swift
//  Exercise-for-Elderly
//
//  Created by Jasmine Mutia Alifa on 20/08/24.
//

import SwiftUI
import HealthKit

struct InputName: View {
    @State private var userName: String = ""
    @State private var navigateToShowAgeInfo = false // State for navigation
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background for the whole screen
                Image("background")
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment:.center, spacing: 10) {
                    HStack {
                        Spacer()
                        Button(action: {
                            // Save the username and navigate to ShowAgeInformation
                            UserDefaults.standard.set(userName, forKey: "UserName")
                            navigateToShowAgeInfo = true
                        }) {
                            Text("Simpan")
                                .fontWeight(.bold)
                                .padding()
                        }
                    }
                    
                    Image("logoDetakKita")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 77, height: 53)
                        .padding(.bottom, 32)
                    
                    Text("Masukkan Nama Anda!")
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    
                    Text("Masukkan nama yang digunakan sehari-hari")
                        .multilineTextAlignment(.center)
                        .font(.body)
                    
                    TextField("Nama", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20))
                        .padding(.bottom, 450)
                    
                    // NavigationLink to ShowAgeInformation
                    NavigationLink(
                        destination: ShowAgeInformation(viewModel: HealthUserDataViewModel(healthStore: HKHealthStore())),
                        isActive: $navigateToShowAgeInfo
                    ) {
                        EmptyView()
                    }
                }
            }
        }
    }
}

#Preview {
    InputName()
}
