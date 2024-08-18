//
//  Button.swift
//  Exercise-for-Elderly
//
//  Created by Hans Zebua on 16/08/24.
//

import SwiftUI

struct ButtoniOS: View {
    var text: String
    var isPressed: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Text(text)
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .fontWeight(.semibold)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 0)
        .frame(width: 274, height: 52, alignment: .center)
        .background(isPressed ? Color(.buttonPressed) : Color(.buttonInnactive))
        .cornerRadius(24)
    }
}
