//
//  StickyAddToCartBar.swift
//  Ibox
//
//  Created by Pratama One on 13/01/26.
//

import SwiftUI

struct StickyAddToCartBar: View {
    let priceText: String
    let installmentText: String
    let onAddToCart: () -> Void
    
    
    var body: some View {
        HStack(spacing: 14) {
            VStack(alignment: .leading, spacing: 4) {
                Text(priceText)
                    .font(.system(size: 18, weight: .bold))
                Text(installmentText)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button(action: onAddToCart) {
                Text("+ Keranjang")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 18)
                    .padding(.vertical, 12)
                    .background(
                        Capsule(style: .continuous).fill(Color.blue)
                    )
            }
            .buttonStyle(.plain)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(.systemGray6))
        )
        .padding(.horizontal, 16)
        .padding(.bottom, 10)
    }
}
