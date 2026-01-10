//
//  AuthErrorBanner.swift
//  Ibox
//
//  Created by Pratama One on 22/12/25.
//

import SwiftUI
import AuthenticationServices

struct AuthErrorBanner: View {
    let message: String
    
    var body: some View {
        Text(message)
            .font(.system(size: 12, weight: .medium))
            .foregroundStyle(.red)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 6)
    }
}
