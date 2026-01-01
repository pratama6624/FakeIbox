//
//  AuthApppleSignInButton.swift
//  Ibox
//
//  Created by Pratama One on 27/12/25.
//

import SwiftUI
import AuthenticationServices

struct AuthApppleSignInButton: View {
    let action: (ASAuthorizationAppleIDRequest) -> Void
    let completion: (Result<ASAuthorization, Error>) -> Void
    
    var body: some View {
        SignInWithAppleButton(.signIn, onRequest: action, onCompletion: completion)
            .signInWithAppleButtonStyle(.whiteOutline)
            .frame(height: 48)
            .frame(maxWidth: .infinity)
            .frame(width: 200)
            .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .stroke(Color(.systemGray3), lineWidth: 1)
            )
    }
}
