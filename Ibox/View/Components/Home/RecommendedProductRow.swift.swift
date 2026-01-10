//
//  RecommendedProductRow.swift.swift
//  Ibox
//
//  Created by Pratama One on 07/01/26.
//

import SwiftUI

struct RecommendedProductRow: View {
    let item: RecommendedProduct
    let onToggleWishlist: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 74, height: 46)
                .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.primary)
                
                Text(item.variant)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(Color(.secondaryLabel))
                
                HStack(spacing: 10) {
                    Text(item.priceText)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(.primary)
                    
                }
                .padding(.top, 2)
            }
            
            Spacer(minLength: 10)
            
            VStack(alignment: .trailing) {
                Button(action: onToggleWishlist) {
                    Image(systemName: item.isWishlisted ? "heart.fill" : "heart")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.primary)
                }
                .buttonStyle(.plain)
                
                Spacer()
                
                RatingStarsView(rating: item.rating)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 18)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color(.systemGray6))
        )
    }
}
