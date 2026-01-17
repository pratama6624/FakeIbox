//
//  ProductInfoCardView.swift
//  Ibox
//
//  Created by Pratama One on 16/01/26.
//

import SwiftUI

struct ProductInfoCardView: View {
    let headline: String
    let subtitle: String
    let onLearnMode: () -> Void
    let onCompare: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            Text("NEW")
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(.orange)
            
            HStack(spacing: 8) {
                Image(systemName: "applelogo")
                    .font(.system(size: 18, weight: .semibold))
                Text(headline)
                    .font(.system(size: 20, weight: .bold))
            }
            
            Text(subtitle)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(Color(.secondaryLabel))
            
            VStack(spacing: 8) {
                Button("Lebih lanjut", action: onLearnMode)
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundStyle(.blue)
                    .buttonStyle(.plain)
                
                Button("Bandingkan dengan model lain", action: onCompare)
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundStyle(.blue)
                    .buttonStyle(.plain)
            }
            .padding(.top, 10)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 18)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(Color(.systemGray3), lineWidth: 1)
        )
    }
}
