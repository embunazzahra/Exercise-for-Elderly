//
//  FishCheckCode.swift
//  IM
//
//  Created by xiaoxiang's m1 mbp on 2024/5/30.
//

import SwiftUI

struct VerficationCodeView: View {
    @Binding var codes: [String]
    @Binding var isFirstResponders: [Bool]
    
    func changeFirstResponder(_ idx: Int) {
        for i in 0..<isFirstResponders.count {
            isFirstResponders[i] = i == idx
        }
    }

    var body: some View {
        VStack {
            HStack(spacing: 8) {
                ForEach(0..<4, id: \.self) { index in
                    VerficationTextField(
                        text: Binding(
                            get: {
                                codes[safe: index] ?? ""
                            },
                            set: { newValue in
                                if index < codes.count {
                                    codes[index] = newValue
                                }
                            }
                        ),
                        isFirstResponder: isFirstResponders[index],
                        onChanged: { value in
                            if index < 3 {
                                self.changeFirstResponder(index + 1)
                            }
                        },
                        onDelete: {
                            if index > 0 {
                                self.changeFirstResponder(index - 1)
                            }
                        }
                    )
                    .frame(width: 80, height: 86)
                    .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                    .cornerRadius(5)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0, green: 0.51, blue: 0.58))
                }
            }
            .padding(.top, 40)
        }
        .padding()
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


//#Preview {
//    VerficationCodeView()
//}
