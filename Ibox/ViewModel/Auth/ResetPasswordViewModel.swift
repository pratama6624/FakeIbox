//
//  ResetPasswordViewModel.swift
//  Ibox
//
//  Created by Pratama One on 26/12/25.
//

import Foundation

// Error Handling Per Field
enum ResetPasswordField: Hashable {
    case emailOrPhone
}

@MainActor
final class ResetPasswordViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var errors: [ResetPasswordField: String] = [:]
    
    @Published var successMessage: String? = nil
    
    let form: AuthFormState
    private let service: AuthServicing
    
    init(form: AuthFormState, service: AuthServicing) {
        self.form = form
        self.service = service
    }
    
    func sendResetLink() async -> Bool {
        errorMessage = nil
        successMessage = nil
        
        // Email or Handphone Validation
        let id = form.emailOrPhone.trimmingCharacters(in: .whitespacesAndNewlines)
        if id.isEmpty {
            errors[.emailOrPhone] = "Email atau nomor telepon wajib diisi"
        }
        
        isLoading = true
        defer { isLoading = false }
        
        do {
            try await service.sendResetLink(identifier: id)
            successMessage = "Silahkan cek email atau nomor telepon Anda untuk mendapatkan link reset password."
            return true
        } catch {
            errorMessage = (error as? LocalizedError)?.errorDescription ?? "Gagal mengirim link reset password."
            return false
        }
    }
}
