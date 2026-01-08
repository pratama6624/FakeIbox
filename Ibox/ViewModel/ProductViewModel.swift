//
//  Untitled.swift
//  Ibox
//
//  Created by Pratama One on 08/01/26.
//

import SwiftUI

@MainActor
final class ProductViewModel: ObservableObject {
    @Published var items: [ProductItem] = []

    func load() {
        items = [
            .init(
                categoryTitle: "iPhone",
                name: "iPhone 15 Pro",
                specs: "256 GB • Titanium",
                imageName: "prod_iphone_15_pro",
                discountPercent: 10,
                oldPriceText: "Rp 21 jt",
                priceText: "Rp 18.9 jt",
                isWishlisted: false
            ),

            .init(
                categoryTitle: "iPhone",
                name: "iPhone 16",
                specs: "128 GB • Base Model",
                imageName: "prod_iphone_16_base",
                discountPercent: nil,
                oldPriceText: nil,
                priceText: "Rp 14.9 jt",
                isWishlisted: true
            ),

            .init(
                categoryTitle: "iPhone",
                name: "iPhone 16 SE",
                specs: "128 GB • SE Series",
                imageName: "prod_iphone_16_se",
                discountPercent: nil,
                oldPriceText: nil,
                priceText: "Rp 9.9 jt",
                isWishlisted: false
            ),

            .init(
                categoryTitle: "iPhone",
                name: "iPhone 17 Pro",
                specs: "256 GB • Pro Series",
                imageName: "prod_iphone_17_pro",
                discountPercent: 25,
                oldPriceText: "Rp 25 jt",
                priceText: "Rp 18.7 jt",
                isWishlisted: false
            )
        ]
    }

    func toggleWishlist(id: ProductItem.ID) {
        guard let idx = items.firstIndex(where: { $0.id == id }) else { return }
        items[idx].isWishlisted.toggle()
    }
}
