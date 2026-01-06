//
//  HomeViewModel.swift
//  Ibox
//
//  Created by Pratama One on 04/01/26.
//

import Foundation
import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var userName: String = "Pratama"
    @Published var selectedStore: String = "Pilih toko"
    
    @Published var promos: [PromoBanner] = []
    @Published var news: [NewsItem] = []
    @Published var categories: [ProductCategory] = []
    
    @Published var recommended: [RecommendedProduct] = []
    @Published var features: [HomeFeature] = []
    @Published var showAllRecommended: Bool = false
    
    var recommendedVisible: [RecommendedProduct] {
        showAllRecommended ? recommended : Array(recommended.prefix(3))
    }
    
    func load() {
        // Dummy data before API
        promos = [
            .init(imageName: "banner_1.jpg"),
            .init(imageName: "banner_2.jpg"),
            .init(imageName: "banner_3.jpg"),
            .init(imageName: "banner_4.jpg"),
            .init(imageName: "banner_5.jpg")
        ]
        
        news = [
            .init(title: "Titanium pro", imageName: "news_1"),
            .init(title: "Kendalikan suara", imageName: "news_2"),
            .init(title: "Era komputasi sparial", imageName: "news_3")
        ]
        
        categories = [
            .init(title: "Mac", subtitle: "Mulai dari Rp 11 juta", imageName: "cat_mac.png"),
            .init(title: "iPhone", subtitle: "Mulai dari Rp 8 juta", imageName: "cat_iphone.png"),
            .init(title: "iPad", subtitle: "Mulai dari Rp 4 juta", imageName: "cat_ipad.png"),
            .init(title: "Watch", subtitle: "Mulai dari Rp 2 juta", imageName: "cat_watch.png"),
            .init(title: "Music", subtitle: "Mulai dari Rp 2 juta", imageName: "cat_music.png"),
            .init(title: "Aksesoris", subtitle: "Mulai dari Rp 300 ribu", imageName: "cat_acc.png")
        ]
        
        recommended = [
            .init(imageName: "prod_macair", name: "Macbook Air 15”", variant: "8/256 Starlight", priceText: "IDR 20.000.000", rating: 5, isWishlisted: false),
            .init(imageName: "prod_mbpm2_1", name: "Macbook Pro M2 13”", variant: "8/256 Gray", priceText: "IDR 20.500.000", rating: 5, isWishlisted: false),
            .init(imageName: "prod_mbpm2_2", name: "Macbook Pro M2 13”", variant: "8/256 Gray", priceText: "IDR 20.500.000", rating: 5, isWishlisted: true),
            .init(imageName: "prod_mbpm2_3", name: "Macbook Pro M2 13”", variant: "8/256 Gray", priceText: "IDR 20.500.000", rating: 4, isWishlisted: false)
        ]

        features = [
            .init(iconName: "checkmark.seal", title: "Official Guarantee", subtitle: "Official Warranty\nProduct"),
            .init(iconName: "headphones", title: "Customer Care", subtitle: "Our team is ready to\nhelp with products"),
            .init(iconName: "shippingbox", title: "Delivery Service", subtitle: "Trusted Delivery"),
            .init(iconName: "sparkles", title: "Many Benefits", subtitle: "Latest Promos and Info\non Latest Products")
        ]
    }
    
    // MARK: Action
    func tapSearch() {}
    func tapNotifications() {}
    func tapMenu() {}
    func tapSelectStore() {}
    func tapSeeAllNews() {}
    func tapPromo(_ promo: PromoBanner) {}
    
    func toggleWishlist(id: RecommendedProduct.ID) {
        guard let idx = recommended.firstIndex(where: { $0.id == id }) else { return }
        recommended[idx].isWishlisted.toggle()
    }
    
    func toggleShowMore() {
        showAllRecommended.toggle()
    }
}
