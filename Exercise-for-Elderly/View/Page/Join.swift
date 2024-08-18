//
//  Join.swift
//  Exercise-for-Elderly
//
//  Created by Hans Zebua on 17/08/24.
//

import SwiftUI

struct Join: View {
        
    @State private var password: String = ""
    
    var body: some View {
                
        NavigationStack {
            VStack {
                PasswordDescription(title: joinTitle, desc: joinDesc)
                
                PasswordField(password: $password)
                
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
            
            ButtoniOS(text: "Start", isPressed: false)
        }
        .padding(.vertical, 100)
    }
}

#Preview {
    Join()
}
