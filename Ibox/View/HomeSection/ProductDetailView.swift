//
//  ProductDetailView.swift
//  Ibox
//
//  Created by Pratama One on 12/01/26.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject private var vm: ProductDetailViewModel
    let onBack: () -> Void
    
    init(product: ProductDetailModels, onBack: @escaping () -> Void) {
        _vm = StateObject(wrappedValue: ProductDetailViewModel(product: product))
        self.onBack = onBack
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                HStack(spacing: 12) {
                    Spacer()

                    Text("Detail Produk")
                        .font(.system(size: 15, weight: .bold))

                    Spacer()
                }
                .padding(.top, 22)
                
                Text(vm.product.name)
                    .font(.system(size: 17, weight: .bold))
                
                Text("SKU: \(vm.product.sku)")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(Color(.secondaryLabel))
                
                SliderImageView(images: [
                    .init(imageName: "ip17promax"),
                    .init(imageName: "ip17promax_1"),
                    .init(imageName: "ip17promax_2"),
                    .init(imageName: "ip17promax_3"),
                ])
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(vm.product.priceText)
                        .font(.system(size: 17, weight: .bold))

                    Text("atau")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(Color(.secondaryLabel))

                    Text(vm.product.installmentText)
                        .font(.system(size: 15, weight: .bold))

                    Button("Simulasi cicilan dan Paylater") {
                        vm.openInstallmentSimulation()
                    }
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(.blue)
                    .buttonStyle(.plain)
                }
                .padding(.top, 6)
                
                ProductBenefitRow(benefits: vm.product.benefits)
                    .padding(.top, 6)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Warna - \(vm.selectedColorLabel)")
                        .font(.system(size: 15, weight: .bold))
                }
                .padding(.top, 6)
                
                Spacer(minLength: 24)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 20)
        }
        .scrollIndicators(.hidden)
        .safeAreaInset(edge: .bottom) {
            StickyAddToCartBar(
                priceText: "Rp25.749.000",
                installmentText: "Rp1.072.875/bln. untuk 24 bln.*",
                onAddToCart: {}
            )
        }
    }
}
