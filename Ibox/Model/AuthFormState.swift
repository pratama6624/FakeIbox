//
//  AuthFormState.swift
//  Ibox
//
//  Created by Pratama One on 26/12/25.
//

import Foundation

@MainActor
final class AuthFormState: ObservableObject {
    // MARK: Login Section
    @Published var emailOrPhone: String = ""
    @Published var password: String = ""
    
    // MARK: Register Section
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var nohandphone: String = ""
    @Published var email: String = ""
    @Published var confirmPassword: String = ""
    @Published var isPasswordVisible: Bool = false
    @Published var agreeToTerms: Bool = false
    
    func resetSensitive() {
        password = ""
        confirmPassword = ""
        isPasswordVisible = false
    }
}
