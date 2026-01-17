//
//  RecommendedMiniItem.swift
//  Ibox
//
//  Created by Pratama One on 17/01/26.
//

import Foundation
import SwiftUI

struct RecommendedMiniItem: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let imageName: String
    let oldPriceText: String
    let priceText: String
    let discountPercent: Int
}
