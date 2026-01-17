//
//  RecommendedViewModel.swift
//  Ibox
//
//  Created by Pratama One on 17/01/26.
//

import SwiftUI

@MainActor
final class RecommendedViewModel: ObservableObject {
    @Published var recommended: [RecommendedMiniItem] = []
    
    func loadRecommeded() {
        recommended = [
            .init(name: "14-inch MacBook Pro M4",
                  imageName: "rec_macbook_m4_14",
                  oldPriceText: "Rp27.990.000",
                  priceText: "Rp26.499.000",
                  discountPercent: 5),

            .init(name: "Apple Watch Series 10",
                  imageName: "rec_watch_s10",
                  oldPriceText: "Rp7.290.000",
                  priceText: "Rp6.299.000",
                  discountPercent: 14),
        ]
    }
    
    func buyNow(_ item: RecommendedMiniItem) {
        print("Buy now:", item.name)
    }
}
