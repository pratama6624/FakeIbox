//
//  ProductItem.swift
//  Ibox
//
//  Created by Pratama One on 08/01/26.
//

import Foundation

enum ProductCategoryType: String, CaseIterable, Hashable {
    case mac = "Mac"
    case iphone = "iPhone"
    case ipad = "iPad"
    case watch = "Watch"
    case music = "Music"
    case accessories = "Accessories"
    
    init?(fromTitle title: String) {
        let t = title.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        switch t {
        case "mac": self = .mac
        case "iphone": self = .iphone
        case "ipad": self = .ipad
        case "watch": self = .watch
        case "music": self = .music
        case "accessories", "accesories": self = .accessories
        default: return nil
        }
    }
}

struct ProductItem: Identifiable, Hashable {
    let id = UUID()
    let category: ProductCategoryType
    let name: String
    let specs: String
    let imageName: String
    let discountPercent: Int?
    let oldPriceText: String?
    let priceText: String
    var isWishlisted: Bool
}
