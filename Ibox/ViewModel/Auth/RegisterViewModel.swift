//
//  RegisterViewModel.swift
//  Ibox
//
//  Created by Pratama One on 26/12/25.
//

import Foundation

// Error Handling Per Field
enum RegisterField: Hashable {
    case firstname, lastname, handphone, email, password, confirmPassword
}

@MainActor
final class RegisterViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var errors: [RegisterField: String] = [:]
    
    let form: AuthFormState
    private let service: AuthServicing
    
    init(form: AuthFormState, service: AuthServicing) {
        self.form = form
        self.service = service
    }
    
    func register() async -> Bool {
        errorMessage = nil
        
        // Firstname Validation
        let firstname = form.firstName.trimmingCharacters(in: .whitespacesAndNewlines)
        if firstname.isEmpty {
            errors[.firstname] = "Nama depan tidak boleh kosong"
        }
        
        // Lastname Validation
        let lastname = form.lastName.trimmingCharacters(in: .whitespacesAndNewlines)
        if lastname.isEmpty {
            errors[.lastname] = "Nama belakang tidak boleh kosong"
        }
        
        // No. handphone Validation
        let nohandphone = form.nohandphone.trimmingCharacters(in: .whitespacesAndNewlines)
        if nohandphone.isEmpty {
            errors[.handphone] = "Nomor telepon tidak boleh kosong"
        }
        
        // Email Validation
        let email = form.email.trimmingCharacters(in: .whitespacesAndNewlines)
        if email.isEmpty || !email.contains("@") {
            errors[.email] = "Email tidak valid"
        }
        
        // Password Validation
        if form.password.isEmpty {
            errors[.password] = "Password tidak boleh kosong"
        } else if form.password.count <= 6 {
            errors[.password] = "Password minimal 6 karakter"
        }
        
        // Confirm Password Validation
        if form.confirmPassword.isEmpty {
            errors[.confirmPassword] = "Password tidak boleh kosong"
        } else if form.confirmPassword != form.password {
            errors[.confirmPassword] = "Password tidak sama"
        }
        
        isLoading = true
        defer { isLoading = false }
        
        do {
            try await service.register(identifier: email, password: form.password)
            return true
        } catch {
            errorMessage = (error as? LocalizedError)?.errorDescription ?? "Terjadi kesalahan"
            return false
        }
    }
}
