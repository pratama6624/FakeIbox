//
//  AuthPasswordField.swift
//  Ibox
//
//  Created by Pratama One on 21/12/25.
//

import SwiftUI
import AuthenticationServices

struct AuthPasswordField: View {
    let placeholder: String
    @Binding var text: String
    @Binding var isVisible: Bool
    var error: String? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Group {
                    if isVisible {
                        TextField(placeholder, text: $text)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                    } else {
                        SecureField(placeholder, text: $text)
                    }
                }

                Button {
                    isVisible.toggle()
                } label: {
                    Image(systemName: isVisible ? "eye.slash" : "eye")
                        .foregroundStyle(Color(.systemGray))
                }
                .buttonStyle(.plain)
            }
            .modifier(AuthFieldChrome(hasError: error != nil))

            AuthFieldErrorText(error: error)
        }
    }
}
