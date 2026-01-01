//
//  AuthSecondaryButton.swift
//  Ibox
//
//  Created by Pratama One on 22/12/25.
//

import SwiftUI
import AuthenticationServices

struct AuthSecondaryButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Capsule().fill(Color.blue.opacity(0.75))
                    .frame(width: 82, height: 36)
                
                Text(title)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.white)
            }
        }
        .buttonStyle(.plain)
    }
}
