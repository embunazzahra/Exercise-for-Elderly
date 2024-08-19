//
//  Create.swift
//  Exercise-for-Elderly
//
//  Created by Hans Zebua on 16/08/24.
//

import SwiftUI

struct Create: View {
    @EnvironmentObject var viewModel: ExerciseRoomViewModel
    @State private var isLoading: Bool = true
    
    var body: some View {
        
        
        //        let randomString = generateRandomFourDigitNumberString()
        NavigationStack{
            if isLoading {
                VStack {
                    ProgressView("Generating Invite Code...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .font(.title2)
                        .padding()
                }
            } else{
                VStack {
                    PasswordDescription(title: createTitle, desc: createDesc)
                    
                    PasswordTextBox(password: viewModel.exerciseRoom?.inviteCode ?? "0000")
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                Spacer()
                
                // Example usage with true condition
                HStack {
                    Text("1")
                        .font(.system(size: 24))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0, green: 0.51, blue: 0.58))
                    Image(systemName: "person.fill")
                        .foregroundColor(Color(red: 0, green: 0.51, blue: 0.58))
                }
                .frame(width: 343, alignment: .top)
                
                NavigationLink(
                    destination: moveToWatch()
                    
                ) {
                    ButtoniOS(text: "Start", isPressed: true)
                }
            }
        }
        .onAppear {
            generateInviteCode()
        }
    }
    
    private func generateInviteCode() {
        isLoading = true
        viewModel.generateInviteCode {
            // Hide the loading indicator once the invite code is generated
            isLoading = false
        }
    }
}


func generateRandomFourDigitNumberString() -> String {
    let randomNumber = Int.random(in: 1000...9999)
    return String(randomNumber)
}

#Preview {
    Create().environmentObject(ExerciseRoomViewModel())
}
