//
//  AuthTextField.swift
//  Ibox
//
//  Created by Pratama One on 21/12/25.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct AuthTextField: View {
    let placeholder: String
    @Binding var text: String
    var error: String? = nil
    var keyboard: UIKeyboardType = .default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            TextField(placeholder, text: $text)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
//                .padding(.horizontal, 14)
                .modifier(AuthFieldChrome(hasError: error != nil))
            
            AuthFieldErrorText(error: error)
        }
    }
}
