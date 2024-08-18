//
//  CustomTextField.swift
//  IM
//
//  Created by xiaoxiang's m1 mbp on 2024/5/30.
//

import Foundation
import SwiftUI

struct VerficationTextField: UIViewRepresentable {

    @Binding var text: String
    var isFirstResponder: Bool
    let onChanged: (String) -> Void
    var onDelete: (() -> Void)

    class Coordinator: NSObject, UITextFieldDelegate {

        @Binding var text: String
        var onDelete: (() -> Void)
        let onChanged: (String) -> Void

        init(
            text: Binding<String>, onChanged: @escaping (String) -> Void,
            onDelete: @escaping (() -> Void)
        ) {
            _text = text
            self.onChanged = onChanged
            self.onDelete = onDelete
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            self.text = textField.text ?? ""
            self.onChanged(textField.text ?? "")
        }

        func textField(
            _ textField: UITextField, shouldChangeCharactersIn range: NSRange,
            replacementString string: String
        ) -> Bool {
            if string.isEmpty {
                textField.text = ""
                self.onDelete()
                return false
            }

            if string.count == 1, string.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil {
                textField.text = string
                self.text = string
                self.onChanged(string)
                return false
            }

            return false
        }

    }

    func makeCoordinator() -> VerficationTextField.Coordinator {
        return Coordinator(text: $text, onChanged: onChanged, onDelete: onDelete)
    }

    func makeUIView(context: UIViewRepresentableContext<VerficationTextField>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.keyboardType = .numberPad
        textField.delegate = context.coordinator
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return textField
    }

    func updateUIView(
        _ uiView: UITextField, context: UIViewRepresentableContext<VerficationTextField>
    ) {
        uiView.text = text
        if isFirstResponder {
            uiView.becomeFirstResponder()
        }
    }
}
