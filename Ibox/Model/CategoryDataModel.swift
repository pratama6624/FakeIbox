//
//  CategoryModel.swift
//  Ibox
//
//  Created by Pratama One on 04/02/24.
//

import Foundation

struct CategoryModel : Identifiable {
    let id: Int
    let categoryName: String
    
    init(id: Int, categoryName: String) {
        self.id = id
        self.categoryName = categoryName
    }
}
