//
//  AccountSupportCard.swift
//  Ibox
//
//  Created by Pratama One on 26/01/26.
//

import SwiftUI

struct AccountSupportCard: View {
    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: "headphones")
                .font(.system(size: 26, weight: .semibold))
                .foregroundStyle(Color.blue.opacity(0.8))
            
            Text("Bebas untuk bertanya, Kami siap untuk membantu")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(Color.blue.opacity(0.85))
            
            Spacer()
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.blue.opacity(0.10))
        )
    }
}
