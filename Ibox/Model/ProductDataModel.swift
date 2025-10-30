//
//  Product.swift
//  Ibox
//
//  Created by Pratama One on 03/02/24.
//

import Foundation

struct ProductModel: Identifiable {
    let id: Int
    let categoryName: String
    let productName: String
    let image: String
    let description: String
    let price: Int
    let discount: Int
    let like: Bool
    
    init(id: Int, categoryName: String, productName: String, image: String, description: String, price: Int, discount: Int, like: Bool) {
        self.id = id
        self.categoryName = categoryName
        self.productName = productName
        self.image = image
        self.description = description
        self.price = price
        self.discount = discount
        self.like = like
    }
}
