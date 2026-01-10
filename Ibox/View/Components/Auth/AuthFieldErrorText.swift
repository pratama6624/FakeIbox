//
//  AuthFieldErrorText.swift
//  Ibox
//
//  Created by Pratama One on 28/12/25.
//

import SwiftUI

struct AuthFieldChrome: ViewModifier {
    let hasError: Bool
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 14)
            .frame(height: 48)
            .background(
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .stroke(hasError ? Color.red : Color(.systemGray3), lineWidth: 1)
            )
    }
}

struct AuthFieldErrorText: View {
    let error: String?
    
    var body: some View {
        if let error, !error.isEmpty {
            Text(error)
                .font(.system(size: 12, weight: .medium))
                .foregroundStyle(.red)
        }
    }
}
