//
//  CartViewModel.swift
//  Ibox
//
//  Created by Pratama One on 17/01/26.
//

import SwiftUI

@MainActor
final class CartViewModel: ObservableObject {
    @Published var deliveredTo: String = "Kukuh Nur Pratama"
    @Published var items: [CartItem] = []
    @Published var chooseAll: Bool = true {
        didSet { setAllSelected(chooseAll) }
    }
    
    func load() {
        items = [
            .init(imageName: "prod_iphone_15_pro",
                  name: "iPhone 15 Pro Max 256GB",
                  variant: "Natural Titanium",
                  oldPriceText: 22_000_000,
                  priceText: 19_800_000,
                  quantity: 1,
                  isSelected: true),

            .init(imageName: "prod_airpods_pro_2",
                  name: "AirPods Pro",
                  variant: "Gen 2 Type C",
                  oldPriceText: nil,
                  priceText: 4_000_000,
                  quantity: 1,
                  isSelected: true)
        ]
        chooseAll = items.allSatisfy { $0.isSelected }
    }
    
    func toggleItem(_ id: CartItem.ID) {
        guard let i = items.firstIndex(where: {$0.id == id }) else { return }
        items[i].isSelected.toggle()
        chooseAll = items.allSatisfy { $0.isSelected }
    }
    
    func setAllSelected(_ value: Bool) {
        for idx in items.indices { items[idx].isSelected = value }
    }
    
    func incrementQty(_ id: CartItem.ID) {
        guard let i = items.firstIndex(where: { $0.id == id }) else { return }
        items[i].quantity = min(99, items[i].quantity + 1)
    }
    
    func decrementQty(_ id: CartItem.ID) {
        guard let i = items.firstIndex(where: { $0.id == id }) else { return }
        items[i].quantity = max(1, items[i].quantity - 1)
    }
    
    func remove(_ id: CartItem.ID) {
        items.removeAll { $0.id == id }
        chooseAll = items.allSatisfy { $0.isSelected }
    }
    
    func removeSelected() {
        items.removeAll { $0.isSelected }
        chooseAll = items.allSatisfy { $0.isSelected }
    }
    
    func moveToWishlist(_ id: CartItem.ID) {
        // MARK: Move to wishlist
        print("Move to wishlist:", id)
        remove(id)
    }
    
    private let rupiah: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .decimal
        f.groupingSeparator = "."
        return f
    }()
    
    func formatIDR(_ value: Int) -> String {
        "Rp " + (rupiah.string(from: NSNumber(value: value)) ?? "\(value)")
    }
    
    var selectedSubTotal: Int {
        items
            .filter { $0.isSelected }
            .map { $0.priceText * $0.quantity }
            .reduce(0, +)
    }
    
    var selectedSubtotalText: String {
        formatIDR(selectedSubTotal)
    }
    
    func subtotalText(for item: CartItem) -> String {
        "Subtotal \(item.priceText)"
    }
}
