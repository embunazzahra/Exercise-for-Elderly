//
//  FirstPage.swift
//  Exercise-for-Elderly
//
//  Created by Jasmine Mutia Alifa on 20/08/24.
//

import Foundation
import SwiftUI
import HealthKit

struct FirstPage: View {
    @State var isActive : Bool = false
    
    // Customise your screen here
    var body: some View {
        if isActive {
            InputName()
//            ShowAgeInformation(viewModel: HealthUserDataViewModel(healthStore: HKHealthStore()))
        } else {
            
            ZStack {
                // Background for the whole screen
                Image("background")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment:. center, spacing: 10){
                    Text("DetakKita")
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                        .padding(.bottom, 80)
                        
                
                    Image("logoDetakKita")
                    .resizable() // agar gambar dapat diubah ukurannya
                           .scaledToFit() // agar gambar menyesuaikan kotak tanpa merubah aspek rasio
                           .frame(width: 233, height: 161) // ukuran gambar
                           .padding(.bottom, 80)
                    
                    Text("Pastikan Anda telah mengatur Tanggal Lahir di dalam Health dan mengizinkan DetakKita untuk mengakses Health.")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20))
                        .padding()
                           
                }

            }
            .onAppear {
            // Delay for 2 seconds before transitioning
//                DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
//                        withAnimation {
//                            self.isActive = true
//                        }
//                    }
            }

        }
    }
}

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        FirstPage()
    }
}
