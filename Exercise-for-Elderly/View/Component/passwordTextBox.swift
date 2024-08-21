//
//  passwordTextBox.swift
//  Exercise-for-Elderly
//
//  Created by Hans Zebua on 17/08/24.
//

import SwiftUI

struct PasswordTextBox: View {
    let password: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            ForEach(0..<4, id: \.self) { index in
                VStack(alignment: .center, spacing: 10) {
                    let character = index < password.count ? password[password.index(password.startIndex, offsetBy: index)] : "•"
                    Text(String(character))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0, green: 0.51, blue: 0.58))
                }
//                .padding(.horizontal, 32)
                .padding(.vertical, 24)
                .frame(width: 80, height: 86, alignment: .center)
                .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                .cornerRadius(5)
            }
        }
        .padding(.top, 40)
    }
}
