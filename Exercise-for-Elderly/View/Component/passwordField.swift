//
//  passwordField.swift
//  Exercise-for-Elderly
//
//  Created by Hans Zebua on 17/08/24.
//

import SwiftUI

struct PasswordField: View {
    @Binding var password: String
    
    var body: some View {
        VStack {
            PasswordTextBox(password: password)
            
            TextField("", text: $password)
                .keyboardType(.numberPad)
                .opacity(0)
                .frame(width: 0, height: 0)
                .onChange(of: password) { newValue in
                    if newValue.count > 4 {
                        password = String(newValue.prefix(4))
                    }
                }
        }
        .onTapGesture {
            // Focus on the hidden TextField when the user taps the view
            UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}
