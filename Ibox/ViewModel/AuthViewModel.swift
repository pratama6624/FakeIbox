//
//  AuthViewModel.swift
//  Ibox
//
//  Created by Pratama One on 21/12/25.
//

import Foundation
import SwiftUI

@MainActor
final class AuthViewModel: ObservableObject {
    // Shared forn state (reusable across views)
    @Published var emailOrPhone: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isPasswordVisible: Bool = false
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    func login() async {
        errorMessage = nil
        guard !emailOrPhone.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Email atau nomor handphone wajib diisi."
            return
        }
        guard password.count >= 6 else {
            errorMessage = "Password minimal 6 karakter."
            return
        }
        
        isLoading = true
        defer { isLoading = false }
        
        // TODO: Call API
        try? await Task.sleep(nanoseconds: 800_000_000)
        // success -> route handled by coordinator / app state
    }
    
    func register() async {
        errorMessage = nil
        guard !emailOrPhone.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Email atau nomor handphone wajib diisi."
            return
        }
        guard password.count >= 6 else {
            errorMessage = "Password minimal 6 karakter."
            return
        }
        guard confirmPassword == password else {
            errorMessage = "Konfirmasi password tidak sama"
            return
        }
        
        isLoading = true
        defer { isLoading = false }
        
        // TODO: Call API
        try? await Task.sleep(nanoseconds: 900_000_000)
    }
    
    func sendResetLink() async {
        errorMessage = nil
        guard !emailOrPhone.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Email atau nomor handphone wajib diisi."
            return
        }
        
        isLoading = true
        defer { isLoading = false }
        
        // TODO: Call API
        try? await Task.sleep(nanoseconds: 700_000_000)
    }
    
    func skip() {
        // TODO: navigate to Home (app level state
    }
}
