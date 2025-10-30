//
//  ProductController.swift
//  Ibox
//
//  Created by Pratama One on 03/02/24.
//

import Foundation

struct ProductController {
    var products: [ProductModel] = []
    
    mutating func fetchProduct() {
        self.products = [
            ProductModel(id: 1, categoryName: "Iphone", productName: "IPhone 15 Pro Max", image: "ip15promax" , description: "16 Gb / 1024 Gb", price: 1199, discount: 10, like: true),
            ProductModel(id: 2, categoryName: "Accecories", productName: "Airpods Pro", image: "airpodspro2" , description: "Gen 2 Type-C", price: 261, discount: 0, like: false),
            ProductModel(id: 3, categoryName: "Mac", productName: "Macbook M2 Pro 16\"", image: "mac.m216" , description: "16 Gb / 1024 Gb", price: 3499, discount: 0, like: false),
            ProductModel(id: 4, categoryName: "IPad", productName: "IPad Pro", image: "ipadm2pro" , description: "Gen 6 Silver 256 Gb", price: 574, discount: 0, like: true),
            ProductModel(id: 5, categoryName: "Iphone", productName: "IPhone 15 Pro Max", image: "ip15promax" , description: "16 Gb / 1024 Gb", price: 1199, discount: 10, like: true),
            ProductModel(id: 6, categoryName: "Accecories", productName: "Airpods Pro", image: "airpodspro2" , description: "Gen 2 Type-C", price: 261, discount: 0, like: false),
        ]
    }
}
