//
//  RecommendedSectionView.swift
//  Ibox
//
//  Created by Pratama One on 16/01/26.
//

import SwiftUI

struct RecommendedSectionView: View {
    let items: [RecommendedMiniItem]
    let onBuyNow: (RecommendedMiniItem) -> Void
    
    var body: some View {
        HStack(spacing: 14) {
            ForEach(items.prefix(2)) { item in
                RecommendedMiniCard(item: item) {
                    onBuyNow(item)
                }
            }
        }
    }
}

struct RecommendedSectionWitTitleView: View {
    let items: [RecommendedMiniItem]
    let onBuyNow: (RecommendedMiniItem) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Mungkin kamu juga suka")
                .font(.system(size: 15, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .center)
            
            HStack(spacing: 14) {
                ForEach(items.prefix(2)) { item in
                    RecommendedMiniCard(item: item) {
                        onBuyNow(item)
                    }
                }
            }
        }
        .padding(.top, 16)
    }
}

private struct RecommendedMiniCard: View {
    let item: RecommendedMiniItem
    let onBuy: () -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color(.systemGray3), lineWidth: 1)
                
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                    .padding(14)
            }
            .frame(height: 150)
            
            Text(item.name)
                .font(.system(size: 14, weight: .semibold))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .padding(.horizontal, 8)
            
            VStack(spacing: 6) {
                Text(item.oldPriceText)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(Color(.secondaryLabel))
                    .strikethrough(true, color: .red)
                
                HStack(spacing: 8) {
                    Text(item.priceText)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.primary)
                    
                    Text("\(item.discountPercent)%")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(.red)
                }
            }
            
            Button(action: onBuy) {
                Text("+ Keranjang")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(Capsule(style: .continuous).fill(Color(.blue)))
            }
            .buttonStyle(.plain)
            .padding(.horizontal, 10)
            
            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity)
    }
}
