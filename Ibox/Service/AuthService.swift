//
//  AuthService.swift
//  Ibox
//
//  Created by Pratama One on 26/12/25.
//

import Foundation

protocol AuthServicing {
    func login(identifier: String, password: String) async throws
    func register(identifier: String, password: String) async throws
    func sendResetLink(identifier: String) async throws
}

enum AuthError: LocalizedError {
    case invalidCredentials
    case network
    
    var errorDescription: String? {
        switch self {
        case .invalidCredentials: return "Login gagal. cek email/nomor dan password."
        case .network: return "Terjadi kesalahan. coba lagi nanti."
        }
    }
}

// MARK: Mock sementara ke API
struct MockAuthService: AuthServicing {
    func login(identifier: String, password: String) async throws {
        try await Task.sleep(nanoseconds: 800_000_000)
        // example: kalau mau gagal lempar ke bagian ini
    }
    
    func register(identifier: String, password: String) async throws {
        try await Task.sleep(nanoseconds: 900_000_000)
    }
    
    func sendResetLink(identifier: String) async throws {
        try await Task.sleep(nanoseconds: 700_000_000)
    }
}
