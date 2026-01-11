//
//  MainFlowView.swift
//  Ibox
//
//  Created by Pratama One on 01/01/26.
//

import SwiftUI

struct MainFlowView: View {
    @EnvironmentObject private var router: AppRouter
    @StateObject private var menuVM = SideMenuViewModel()
    @State private var path: [SideMenuRoute] = []
    
    var body: some View {
        NavigationStack(path: $router.mainPath) {
            SideMenuContainerView(vm: menuVM) {
                MainTabView(openMenu: { menuVM.open() })
                    .navigationDestination(for: SideMenuRoute.self) { route in
                        destination(for: route)
                    }
                    .onChange(of: menuVM.selectedRoute) { _, newValue in
                        guard let r = newValue else { return }
                        path.append(r)
                    }
            }
        }
    }
    
    @ViewBuilder
    private func destination(for route: SideMenuRoute) -> some View {
        switch route {
        case .profile: Text("Profil")
        case .latestNews: Text("Berita Terbaru")
        case .products: Text("Produk")
        case .wishlist: Text("Disukai")
        case .cart: Text("Keranjang Belanja")
        case .haloBox: Text("Halo Box")
        case .activity: Text("Aktivitas")
        case .installments: Text("Cicilan & Pembayaran")
        case .storeList: Text("Daftar Toko")
        case .supportCenter: Text("Pusat Layanan")
        case .installmentsHelp: Text("Cicilan & Pembayaran")
        }
    }
}
