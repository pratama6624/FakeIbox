//
//  LoginViewModel.swift
//  Ibox
//
//  Created by Pratama One on 26/12/25.
//

import Foundation

// Error Handling Per Field
enum LoginField: Hashable {
    case emailOrPhone, password
}

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var errors: [LoginField: String] = [:]
    
    let form: AuthFormState
    private let service: AuthServicing
    
    init(form: AuthFormState, service: AuthServicing) {
        self.form = form
        self.service = service
    }
    
    func login() async -> Bool {
        errorMessage = nil
        
        // Email / No Handphone Validation
        let id = form.emailOrPhone.trimmingCharacters(in: .whitespacesAndNewlines)
        if id.isEmpty {
            errors[.emailOrPhone] = "Email atau nomor handphone wajib diisi."
        }
        
        // Password Validation
        if form.password.isEmpty {
            errors[.password] = "Password wajib diisi."
        } else if form.password.count <= 6 {
            errors[.password] = "Password minimal 6 karakter."
        }
        
        isLoading = true
        defer { isLoading = false }
        
        do {
            try await service.login(identifier: id, password: form.password)
            return true
        } catch {
            errorMessage = (error as? LocalizedError)?.errorDescription ?? "Terjadi kesalahan."
            return false
        }
    }
    
    private func isValidEmail(_ s: String) -> Bool {
        // cukup untuk UI validation, ga usah “regex dari neraka”
        let pattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return s.range(of: pattern, options: .regularExpression) != nil
    }
}
