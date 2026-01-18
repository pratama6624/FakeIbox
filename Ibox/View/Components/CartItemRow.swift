//
//  CartItemRow.swift
//  Ibox
//
//  Created by Pratama One on 17/01/26.
//

import SwiftUI

struct CartItemRow: View {
    @StateObject private var cartVM = CartViewModel()
    let item: CartItem
    let onToggle: () -> Void
    let onMinus: () -> Void
    let onPlus: () -> Void
    let onRemove: () -> Void
    let onWishlist: () -> Void
    let subtotalText: String
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(alignment: .top, spacing: 10) {
                VStack {
                    Image(item.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.name)
                        .font(.system(size: 13, weight: .medium))

                    Text(item.variant)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(Color(.secondaryLabel))

                    HStack(spacing: 8) {
                        if let old = item.oldPriceText {
                            Text("Price \(old)")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundStyle(Color(.secondaryLabel))
                                .strikethrough(true, color: .red)
                        }

                        Text(cartVM.formatIDR(item.priceText))
                            .font(.system(size: 12, weight: .medium))
                    }

                    Text(subtotalText)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(.primary)
                }

                Spacer()
                
                VStack(spacing: 6) {
                    VStack(spacing: 10) {
                        Button(action: onMinus) { Text("–").font(.system(size: 12, weight: .medium)) }
                            .buttonStyle(.plain)

                        Text("\(item.quantity)")
                            .font(.system(size: 12, weight: .medium))
                            .frame(width: 20)

                        Button(action: onPlus) { Text("+").font(.system(size: 12, weight: .medium)) }
                            .buttonStyle(.plain)
                    }
                    .padding(.horizontal, 5)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(Color(.systemGray6))
                    )
                }
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color(.systemGray3), lineWidth: 1)
            )
            
            // action row
            HStack {
                Button(action: onToggle) {
                    Image(systemName: item.isSelected ? "checkmark.circle.fill" : "circle")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(item.isSelected ? Color.black : Color(.systemGray3))
                }
                .buttonStyle(.plain)
                
                Spacer()
                
                Button(action: onRemove) {
                    Text("Hapus")
                        .font(.system(size: 12, weight: .semibold))
                }
                .buttonStyle(.plain)
                .foregroundStyle(.primary)
                .padding(.trailing, 20)

                Button(action: onWishlist) {
                    Text("Disukai")
                        .font(.system(size: 12, weight: .semibold))
                }
                .buttonStyle(.plain)
                .foregroundStyle(.primary)
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 6)
        }
    }
}
