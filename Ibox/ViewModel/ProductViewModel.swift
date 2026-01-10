//
//  Untitled.swift
//  Ibox
//
//  Created by Pratama One on 08/01/26.
//

import SwiftUI

@MainActor
final class ProductViewModel: ObservableObject {
    @Published private(set) var items: [ProductItem] = []
    @Published var selectedCategory: ProductCategoryType = .mac
    @Published var page: Int = 1
    @Published var totalPage: Int = 1
    
    private var allItems: [ProductItem] = []

    func load() {
        allItems = [
            // iPhone (6)
            .init(category: .iphone, name: "iPhone 15 Pro", specs: "256 GB • Titanium", imageName: "prod_iphone_15_pro", discountPercent: 10, oldPriceText: "Rp 21 jt", priceText: "Rp 18.9 jt", isWishlisted: false),
            .init(category: .iphone, name: "iPhone 15", specs: "128 GB • Blue", imageName: "prod_iphone_15", discountPercent: nil, oldPriceText: nil, priceText: "Rp 12.9 jt", isWishlisted: true),
            .init(category: .iphone, name: "iPhone 16", specs: "128 GB • Base Model", imageName: "prod_iphone_16_base", discountPercent: nil, oldPriceText: nil, priceText: "Rp 14.9 jt", isWishlisted: false),
            .init(category: .iphone, name: "iPhone 16 Plus", specs: "256 GB • Plus Series", imageName: "prod_iphone_16_plus", discountPercent: 8, oldPriceText: "Rp 18 jt", priceText: "Rp 16.5 jt", isWishlisted: false),
            .init(category: .iphone, name: "iPhone 16 SE", specs: "128 GB • SE Series", imageName: "prod_iphone_16_se", discountPercent: nil, oldPriceText: nil, priceText: "Rp 9.9 jt", isWishlisted: false),
            .init(category: .iphone, name: "iPhone 17 Pro", specs: "256 GB • Pro Series", imageName: "prod_iphone_17_pro", discountPercent: 12, oldPriceText: "Rp 25 jt", priceText: "Rp 21.9 jt", isWishlisted: true),

            // Mac (6)
            .init(category: .mac, name: "MacBook Air 13”", specs: "M3 • 8/256", imageName: "prod_mac_air_13_m3", discountPercent: nil, oldPriceText: nil, priceText: "Rp 17.9 jt", isWishlisted: false),
            .init(category: .mac, name: "MacBook Air 15”", specs: "M3 • 8/256", imageName: "prod_mac_air_15_m3", discountPercent: 7, oldPriceText: "Rp 22 jt", priceText: "Rp 20.4 jt", isWishlisted: false),
            .init(category: .mac, name: "MacBook Pro 14”", specs: "M3 Pro • 18/512", imageName: "prod_macbook_pro_14_m3pro", discountPercent: nil, oldPriceText: nil, priceText: "Rp 33.9 jt", isWishlisted: true),
            .init(category: .mac, name: "MacBook Pro 16”", specs: "M3 Max • 36/1TB", imageName: "prod_macbook_pro_16_m3max", discountPercent: 5, oldPriceText: "Rp 59 jt", priceText: "Rp 55.9 jt", isWishlisted: false),
            .init(category: .mac, name: "iMac 24”", specs: "M3 • 8/256", imageName: "prod_imac_24_m3", discountPercent: nil, oldPriceText: nil, priceText: "Rp 24.9 jt", isWishlisted: false),
            .init(category: .mac, name: "Mac mini", specs: "M2 • 8/256", imageName: "prod_mac_mini_m2", discountPercent: 10, oldPriceText: "Rp 11 jt", priceText: "Rp 9.9 jt", isWishlisted: false),

            // iPad (5)
            .init(category: .ipad, name: "iPad Pro 11”", specs: "M4 • 256 GB • Wi-Fi", imageName: "prod_ipad_pro_11_m4", discountPercent: nil, oldPriceText: nil, priceText: "Rp 19.9 jt", isWishlisted: true),
            .init(category: .ipad, name: "iPad Pro 13”", specs: "M4 • 512 GB • Wi-Fi", imageName: "prod_ipad_pro_13_m4", discountPercent: 6, oldPriceText: "Rp 32 jt", priceText: "Rp 29.9 jt", isWishlisted: false),
            .init(category: .ipad, name: "iPad Air 11”", specs: "M2 • 256 GB • Wi-Fi", imageName: "prod_ipad_air_11_m2", discountPercent: nil, oldPriceText: nil, priceText: "Rp 12.9 jt", isWishlisted: false),
            .init(category: .ipad, name: "iPad 10th Gen", specs: "64 GB • Wi-Fi", imageName: "prod_ipad_10th", discountPercent: 9, oldPriceText: "Rp 7.7 jt", priceText: "Rp 6.9 jt", isWishlisted: false),

            // Watch (4)
            .init(category: .watch, name: "Apple Watch Series 9", specs: "45mm • GPS", imageName: "prod_watch_s9_45", discountPercent: 10, oldPriceText: "Rp 7.7 jt", priceText: "Rp 6.9 jt", isWishlisted: false),
            .init(category: .watch, name: "Apple Watch Ultra 2", specs: "49mm • Titanium", imageName: "prod_watch_ultra2", discountPercent: nil, oldPriceText: nil, priceText: "Rp 15.9 jt", isWishlisted: true),
            .init(category: .watch, name: "Apple Watch SE", specs: "44mm • GPS", imageName: "prod_watch_se_44", discountPercent: 8, oldPriceText: "Rp 4.9 jt", priceText: "Rp 4.5 jt", isWishlisted: false),
            .init(category: .watch, name: "Apple Watch Series 8", specs: "41mm • GPS", imageName: "prod_watch_s8_41", discountPercent: 12, oldPriceText: "Rp 6.8 jt", priceText: "Rp 5.9 jt", isWishlisted: false),

            // Music (2)
            .init(category: .music, name: "AirPods Pro (2nd Gen)", specs: "USB-C • Active Noise Cancellation", imageName: "prod_airpods_pro_2", discountPercent: nil, oldPriceText: nil, priceText: "Rp 3.9 jt", isWishlisted: true),
            .init(category: .music, name: "AirPods Max", specs: "Over-Ear • Spatial Audio", imageName: "prod_airpods_max", discountPercent: 7, oldPriceText: "Rp 9.9 jt", priceText: "Rp 9.2 jt", isWishlisted: false),

            // Accessories (2)
            .init(category: .accessories, name: "MagSafe Charger", specs: "15W • USB-C", imageName: "prod_magsafe_charger", discountPercent: nil, oldPriceText: nil, priceText: "Rp 699 rb", isWishlisted: false),
            .init(category: .accessories, name: "Apple Pencil (2nd Gen)", specs: "For iPad • Magnetic Pairing", imageName: "prod_apple_pencil_2", discountPercent: 10, oldPriceText: "Rp 2.2 jt", priceText: "Rp 1.98 jt", isWishlisted: true),
        ]
        
        applyFilterAndPaging()
    }
    
    func selectCategory(_ category: ProductCategoryType) {
        guard selectedCategory != category else { return }
        selectedCategory = category
        goToPage(1)
        applyFilterAndPaging()
    }
    
    func goToPage(_ newPage: Int) {
        page = newPage
        applyFilterAndPaging()
    }

    func toggleWishlist(id: ProductItem.ID) {
        guard let idx = items.firstIndex(where: { $0.id == id }) else { return }
        allItems[idx].isWishlisted.toggle()
        applyFilterAndPaging()
    }
    
    private func applyFilterAndPaging() {
        let filtered = allItems.filter { $0.category == selectedCategory }
        
        let perPage = 4
        let start = (page - 1) * perPage
        let end = min(start + perPage, filtered.count)
        
        totalPage = max(1, (filtered.count + perPage - 1) / perPage)
        
        if start < filtered.count {
            items = Array(filtered[start..<end])
        } else {
            items = []
        }
    }
    
    var totalPages: Int {
        let perPage = 4
        let filteredCount = allItems.filter { $0.category == selectedCategory }.count
        return max(Int(ceil(Double(filteredCount) / Double(perPage))), 1)
    }
}
