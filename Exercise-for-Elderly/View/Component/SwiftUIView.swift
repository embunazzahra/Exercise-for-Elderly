//
//  SwiftUIView.swift
//  Exercise-for-Elderly
//
//  Created by Hans Zebua on 17/08/24.
//

import SwiftUI

struct PasswordDescription: View {
    
    var title: String
    var desc: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .top)
            
            Text(desc)
                .font(.body)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .top)
        }
        .padding(0)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding(.horizontal)
    }
}
