//
//  HomeModel.swift
//  Ibox
//
//  Created by Pratama One on 03/01/26.
//

import Foundation

struct PromoBanner: Identifiable, Hashable {
    let id = UUID()
    let imageName: String
}

struct NewsItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let imageName: String
}

struct ProductCategory: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
}

struct RecommendedProduct: Identifiable, Hashable {
    let id = UUID()
    let imageName: String
    let name: String
    let variant: String
    let priceText: String
    var isWishlisted: Bool
}

struct HomeFeature: Identifiable, Hashable {
    let id = UUID()
    let iconName: String
    let title: String
    let subtitle: String
}
