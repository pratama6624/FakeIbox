//
//  ProductDetailModels.swift
//  Ibox
//
//  Created by Pratama One on 12/01/26.
//

import Foundation

struct ProductVariant: Identifiable, Hashable {
    let id = UUID()
    let colorName: String
    let imageNames: [String]
}

struct ProductBenefit: Identifiable, Hashable {
    let id = UUID()
    let systemIcon: String
    let title: String
}

struct ProductDetailModels: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let sku: String
    
    let priceText: String
    let installmentText: String
    
    let variants: [ProductVariant]
    let benefits: [ProductBenefit]
}
