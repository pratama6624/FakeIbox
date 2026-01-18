//
//  CartView.swift
//  Ibox
//
//  Created by Pratama One on 05/01/26.
//

import SwiftUI

struct CartView: View {
    let onLogout: () -> Void
    @StateObject private var vm = HomeViewModel()
    @StateObject private var cartVM = CartViewModel()
    @StateObject private var recommendedProduct = RecommendedViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                
                HStack {
                    Button {
                        cartVM.chooseAll.toggle()
                    } label: {
                        HStack(spacing: 8) {
                            Image(systemName: cartVM.chooseAll ? "checkmark.circle.fill" : "circle")
                            Text("Pilih semua")
                                .font(.system(size: 14, weight: .medium))
                        }
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(.primary)

                    Spacer()

                    Button("Bersihkan") {
                        cartVM.removeSelected()
                    }
                    .font(.system(size: 12, weight: .medium))
                    .buttonStyle(.plain)
                    .foregroundStyle(.secondary)
                }
                .padding(.top, 2)
                
                HStack(spacing: 8) {
                    Image(systemName: "truck.box")
                    Text("Diantar ke \(cartVM.deliveredTo)")
                        .font(.system(size: 12, weight: .medium))
                    Image(systemName: "chevron.down")
                        .font(.system(size: 14, weight: .medium))
                    Spacer()
                }
                .foregroundStyle(.primary)
                .padding(.top, 16)
                .padding(.bottom, 16)
                
                VStack(spacing: 30) {
                    ForEach(cartVM.items) { item in
                        CartItemRow(
                            item: item,
                            onToggle: { cartVM.toggleItem(item.id) },
                            onMinus: { cartVM.decrementQty(item.id) },
                            onPlus: { cartVM.incrementQty(item.id) },
                            onRemove: { cartVM.remove(item.id) },
                            onWishlist: { cartVM.moveToWishlist(item.id) },
                            subtotalText: cartVM.subtotalText(for: item)
                        )
                    }
                }

                Text("Promosi dapat berubah setiap waktu")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(.primary)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                    .padding(.top, 16)
                
                RecommendedSectionWitTitleView(items: recommendedProduct.recommended) { item in
                    recommendedProduct.buyNow(item)
                }
                .padding(.top, 20)
                
                HStack {
                    Spacer()
                    
                    Text("Total \(cartVM.items.count) Produk")
                        .font(.system(size: 15, weight: .bold))
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                    
                    Spacer()
                }
                
                HStack(spacing: 14) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(cartVM.selectedSubtotalText)
                            .font(.system(size: 18, weight: .bold))
                    }
                    
                    Spacer()
                    
                    Button (
                        action: {
                            // Todo something
                        }
                    ) {
                        Text("Pembayaran")
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
                .padding(.bottom, 20)

                FeatureGridView(items: vm.features)
                .padding(.top, 6)
                
            }
            .padding(.bottom, 20)
        }
        .scrollIndicators(.hidden)
        .onAppear {
            vm.load()
            cartVM.load()
            recommendedProduct.loadRecommeded()
        }
    }
}

