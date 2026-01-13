//
//  SideMenuViewModel.swift
//  Ibox
//
//  Created by Pratama One on 11/01/26.
//

import SwiftUI

@MainActor
final class SideMenuViewModel: ObservableObject {
    @Published var isOpen: Bool = false
    @Published var selectedRoute: SideMenuRoute? = nil
    
    @Published var userName: String = "Pratama"
    @Published var avatarSystemImage: String = "profile.jpg"
    
    enum AppLanguage: String, CaseIterable, Identifiable {
        case id = "Bahasa Indonesia"
        case en = "English"
        var id: String { rawValue }
    }
    @Published var language: AppLanguage = .id
    
    let primaryItems: [SideMenuItem] = [
        .init(title: "Profil", systemImage: "person.crop.circle", route: .profile),
        .init(title: "Berita Terbaru", systemImage: "newspaper", route: .latestNews),
        .init(title: "Produk", systemImage: "display", route: .products),
        .init(title: "Disukai", systemImage: "heart", route: .wishlist),
        .init(title: "Keranjang Belanja", systemImage: "cart", route: .cart),
        .init(title: "Halo Box", systemImage: "waveform.circle", route: .haloBox),
        .init(title: "Aktivitas", systemImage: "arrow.left.arrow.right", route: .activity),
        .init(title: "Cicilan & Pembayaran", systemImage: "creditcard", route: .installments)
    ]
    
    let secondaryItems: [SideMenuItem] = [
        .init(title: "Daftar Toko", systemImage: "mappin.and.ellipse", route: .storeList),
        .init(title: "Pusat Layanan", systemImage: "wrench.and.screwdriver", route: .supportCenter),
        .init(title: "Pengaturan", systemImage: "gearshape", route: .installmentsHelp)
    ]
    
    func open() {
        print("Open tapped")
        withAnimation(.spring(response: 0.35, dampingFraction: 0.9)) {
            isOpen = true
        }
    }
    
    func close() {
        withAnimation(.spring(response: 0.35, dampingFraction: 0.9)) {
            isOpen = false
        }
    }
    
    func select(_ route: SideMenuRoute) {
        selectedRoute = route
        close()
    }
    
    func toogle() {
        isOpen ? close() : open()
    }
    
    func logoutTapped() {
        // MARK: TODO
    }
}
