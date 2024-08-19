//
//  Join.swift
//  Exercise-for-Elderly
//
//  Created by Hans Zebua on 17/08/24.
//

import SwiftUI

struct Join: View {
    @EnvironmentObject var viewModel: ExerciseRoomViewModel
    @State private var codes: [String] = Array(repeating: "", count: 4)
    @State private var isFirstResponders: [Bool] = [true, false, false, false]
    @State private var concatenatedCodes: String = ""
    @State private var isButtonPressed: Bool = false
    @State private var navigateToWatch: Bool = false
    // Computed property to concatenate codes
    private var concatenatedCodesString: String {
        codes.joined()
    }
    
    var body: some View {
        
        VStack {
            PasswordDescription(title: joinTitle, desc: joinDesc)
            
            VerficationCodeView(
                codes: $codes,
                isFirstResponders: $isFirstResponders
            )
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
            Spacer()
            
            // Display concatenated codes
            if !concatenatedCodes.isEmpty {
                VStack {
                    Text("Concatenated Codes:")
                        .font(.headline)
                    Text(concatenatedCodes)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0, green: 0.51, blue: 0.58))
                }
                .padding(.top, 20)
            }
            
            
            ButtoniOS(text: "Start", isPressed: isButtonPressed)
                .disabled(!isButtonPressed)
                .background(
                    NavigationLink(destination: moveToWatch().environmentObject(viewModel), isActive: $navigateToWatch) {
                        EmptyView() // Hidden NavigationLink
                    }
                )
                .onTapGesture {
                    if isButtonPressed {
                        viewModel.inviteCode = concatenatedCodes
                        navigateToWatch = true // Trigger navigation
                    }
                }
        }
        .padding(.vertical, 100)
        .onChange(of: codes) { newCodes in
            // Update concatenatedCodes when codes change
            concatenatedCodes = concatenatedCodesString
            // Set isButtonPressed to true if concatenatedCodes length is 4
            isButtonPressed = concatenatedCodes.count == 4
        }
        
    }
}

#Preview {
    Join().environmentObject(ExerciseRoomViewModel())
}


