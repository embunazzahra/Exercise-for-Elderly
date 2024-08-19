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

                ButtoniOS(text: "Start", isPressed: false)
            }
            .padding(.vertical, 100)
            .onChange(of: codes) { newCodes in
                // Update concatenatedCodes when codes change
                concatenatedCodes = concatenatedCodesString
            }
        
    }
}

#Preview {
    Join().environmentObject(ExerciseRoomViewModel())
}


