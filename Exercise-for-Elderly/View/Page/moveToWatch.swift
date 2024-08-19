//
//  moveToWatch.swift
//  Exercise-for-Elderly
//
//  Created by Hans Zebua on 17/08/24.
//

import SwiftUI

struct moveToWatch: View {
    @EnvironmentObject var viewModel: ExerciseRoomViewModel
    
    var body: some View {
        
        VStack {
            if viewModel.isLoading {
                ProgressView("Joining Room...")
            }
            else {
                VStack{
                    Text("Time to Get Moving!")
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .frame(width: 343, alignment: .top)
                        .padding()
                    
                    Image(systemName: "applewatch")
                        .font(.system(size: 150))
                        .padding()
                    
                    VStack{
                        Text("Your exercise session\nis about to begin.")
                            .font(.title2)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .top)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Text("Switch to Your Apple Watch and make sure it's on to kick off your running session.")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .top)
                    }
                    .padding()
                }
                .padding()
            }
            
        }
        .onAppear {
            viewModel.isLoading = true
            viewModel.joinRoom {
                viewModel.isLoading = false
            }
        }
        
    }
}

#Preview {
    moveToWatch()
        .environmentObject(ExerciseRoomViewModel())
}
