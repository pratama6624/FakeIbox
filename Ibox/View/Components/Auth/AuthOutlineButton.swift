//
//  AuthOutlineButton.swift
//  Ibox
//
//  Created by Pratama One on 22/12/25.
//

import SwiftUI
import AuthenticationServices

struct AuthOutlineButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 5) {
                Text(title)
                    .font(.system(size: 18, weight: .medium))
            }
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity)
            .frame(width: 200, height: 48)
            .background(
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .stroke(Color(.systemGray3), lineWidth: 1)
            )
        }
    }
}
