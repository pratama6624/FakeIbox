//
//  ProductCardView.swift.swift
//  Ibox
//
//  Created by Pratama One on 08/01/26.
//

import SwiftUI

struct ProductCardView: View {
    let item: ProductItem
    let onTapWishlist: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            ZStack(alignment: .bottomTrailing) {
                // Image area
                ZStack {
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(Color(.systemGray6))

                    Image(item.imageName)
                        .resizable()
                        .scaledToFit()
                        .padding(12)
                }
                .frame(height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                .overlay(alignment: .bottomLeading) {
                    if let d = item.discountPercent {
                        Text("\(d)%")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(
                                RoundedRectangle(cornerRadius: 8, style: .continuous)
                                    .fill(Color.red)
                            )
                            .padding(10)
                    }
                }

                // Heart button
                Button(action: onTapWishlist) {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 36, height: 36)
                            .shadow(color: .black.opacity(0.12), radius: 6, x: 0, y: 3)

                        Image(systemName: item.isWishlisted ? "heart.fill" : "heart")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(item.isWishlisted ? Color.red : Color.black)
                    }
                }
                .buttonStyle(.plain)
                .padding(10)
            }
            
            Text(item.category.rawValue)
                .font(.system(size: 15, weight: .semibold))
            
            Text(item.name)
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(.primary)

            Text(item.specs)
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(.secondary)

            // Price row
            HStack(spacing: 10) {
                if let old = item.oldPriceText {
                    Text(old)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.primary.opacity(0.55))
                        .strikethrough(true, color: .red)
                }

                Text(item.priceText)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.primary)
            }

            Spacer(minLength: 0)
        }
        .padding(7)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.white)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Color.black.opacity(0.04), lineWidth: 1)
        )
    }
}
