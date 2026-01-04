//
//  HomeViewModel.swift
//  Ibox
//
//  Created by Pratama One on 04/01/26.
//

import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var userName: String = "Pratama"
    @Published var selectedStore: String = "Pilih toko"
    
    @Published var promos: [PromoBanner] = []
    @Published var news: [NewsItem] = []
    @Published var categories: [ProductCategory] = []
    
    func load() {
        // Dummy data before API
        promos = [
            .init(imageName: "banner_1.jpg"),
            .init(imageName: "banner_2.jpg"),
            .init(imageName: "banner_3.jpg")
        ]
        
        news = [
            .init(title: "iPhone 17", imageName: "news_1"),
            .init(title: "Airpods Pro", imageName: "news_2"),
            .init(title: "Vision Pro", imageName: "news_3")
        ]
        
        categories = [
            .init(title: "Mac", subtitle: "Mulai dari Rp 11 juta", imageName: "cat_mac"),
            .init(title: "iPhone", subtitle: "Mulai dari Rp 8 juta", imageName: "cat_iphone"),
            .init(title: "iPad", subtitle: "Mulai dari Rp 4 juta", imageName: "cat_ipad"),
            .init(title: "Watch", subtitle: "Mulai dari Rp 2 juta", imageName: "cat_watch"),
            .init(title: "Music", subtitle: "Mulai dari Rp 2 juta", imageName: "cat_music"),
            .init(title: "Aksesoris", subtitle: "Mulai dari Rp 300 ribu", imageName: "cat_acc")
        ]
    }
    
    // MARK: Action
    func tapSearch() {}
    func tapNotifications() {}
    func tapMenu() {}
    func tapSelectStore() {}
    func tapSeeAllNews() {}
    func tapPromo(_ promo: PromoBanner) {}
}
