//
//  CartModels.swift
//  Ibox
//
//  Created by Pratama One on 17/01/26.
//

import Foundation

struct CartItem: Identifiable, Hashable {
    let id = UUID()
    let imageName: String
    let name: String
    let variant: String
    
    let oldPriceText: Int?
    let priceText: Int
    
    var quantity: Int
    var isSelected: Bool
}
