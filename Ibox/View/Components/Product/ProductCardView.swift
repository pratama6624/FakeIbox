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
    @State private var isShowingDetail = false
    
    let dummy = ProductDetailModels(
        name: "IPhone 17 Pro Max",
        sku: "8100226822",
        priceText: "Rp25.749.000",
        installmentText: "Rp1.072.875/bln. untuk 24 bln.*",
        variants: [
            .init(
                colorName: "Orange",
                imageNames: [
                    "ip17promax", "ip17promax_1", "ip17promax_2", "ip17promax_3"
                ]
            )
        ],
        benefits: [
            .init(systemIcon: "checkmark.seal", title: "Ready Stok"),
            .init(systemIcon: "truck.box", title: "Gratis ongkir"),
            .init(systemIcon: "creditcard", title: "Cicilan 0%")
        ],
        colorOption: [
            .init(name: "Oranye Kosmik", color: Color(red: 0.96, green: 0.53, blue: 0.20)),
            .init(name: "Biru Pekat", color: Color(red: 0.10, green: 0.17, blue: 0.36)),
            .init(name: "Perak", color: Color(red: 0.86, green: 0.86, blue: 0.86))
        ],
        modelOption: [
            .init(title: "iPhone 17 Pro"),
            .init(title: "iPhone 17 Pro Max")
        ],
        capacityOptions: [
            .init(title: "256 GB"),
            .init(title: "512 GB"),
            .init(title: "1 TB"),
            .init(title: "2 TB")
        ]
    )
    
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
            .contentShape(Rectangle())
            .onTapGesture { isShowingDetail = true }
            
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
        .sheet(isPresented: $isShowingDetail) {
            ProductDetailView(product: dummy, onBack: {})
                .presentationDetents([.large]) // sheet dari bawah, besar
                .presentationDragIndicator(.visible)
        }
    }
}
