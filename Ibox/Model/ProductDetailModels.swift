//
//  ProductDetailModels.swift
//  Ibox
//
//  Created by Pratama One on 12/01/26.
//

import Foundation
import SwiftUI

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

struct OptionItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
}

struct ColorOption: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let color: Color
}

struct ProductDetailModels: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let sku: String
    
    let priceText: String
    let installmentText: String
    
    let variants: [ProductVariant]
    let benefits: [ProductBenefit]
    
    let colorOption: [ColorOption]
    let modelOption: [OptionItem]
    let capacityOptions: [OptionItem]
}
