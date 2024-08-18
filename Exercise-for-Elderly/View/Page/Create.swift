//
//  Create.swift
//  Exercise-for-Elderly
//
//  Created by Hans Zebua on 16/08/24.
//

import SwiftUI

struct Create: View {
    var body: some View {
        
        let randomString = generateRandomFourDigitNumberString()
        
        NavigationStack {
            VStack {
                PasswordDescription(title: createTitle, desc: createDesc)
                
                PasswordTextBox(password: randomString)
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
            
            ButtoniOS(text: "Start", isPressed: true)
        }
        .padding(.vertical, 100)
    }
}


func generateRandomFourDigitNumberString() -> String {
    let randomNumber = Int.random(in: 1000...9999)
    return String(randomNumber)
}

#Preview {
    Create()
}
