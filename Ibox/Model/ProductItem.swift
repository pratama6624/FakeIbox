//
//  ProductItem.swift
//  Ibox
//
//  Created by Pratama One on 08/01/26.
//

import Foundation

struct ProductItem: Identifiable, Hashable {
    let id = UUID()
    let categoryTitle: String
    let name: String
    let specs: String
    let imageName: String
    let discountPercent: Int?
    let oldPriceText: String?
    let priceText: String
    var isWishlisted: Bool
}
