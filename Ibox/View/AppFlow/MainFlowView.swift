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
    
    var body: some View {
        NavigationStack(path: $router.mainPath) {
            SideMenuContainerView(vm: menuVM) {
                MainTabView(selectedTab: $router.selectedTab, openMenu: { menuVM.open() })
                    .navigationDestination(for: SideMenuRoute.self) { route in
                        destination(for: route)
                    }
                    .onChange(of: menuVM.selectedRoute) { _, newValue in
                        guard let r = newValue else { return }
                        handleSideMenuRoute(r)
                        menuVM.selectedRoute = nil
                    }
            }
        }
    }
    
    private func handleSideMenuRoute(_ route: SideMenuRoute) {
        switch route {
            case .profile:
                router.selectedTab = .account
            case .products:
                router.selectedTab = .product
            case .cart:
                router.selectedTab = .cart
            case .wishlist:
                router.selectedTab = .wislish

            case .latestNews, .haloBox, .activity, .installments,
                 .storeList, .supportCenter, .installmentsHelp:
                router.mainPath.append(route)
        }
    }
    
    @ViewBuilder
    private func destination(for route: SideMenuRoute) -> some View {
        switch route {
        case .latestNews: Text("Berita Terbaru")
        case .haloBox: Text("Halo Box")
        case .activity: Text("Aktivitas")
        case .installments: Text("Cicilan & Pembayaran")
        case .storeList: Text("Daftar Toko")
        case .supportCenter: Text("Pusat Layanan")
        case .installmentsHelp: Text("Cicilan & Pembayaran")
            
        case .profile, .products, .wishlist, .cart:
            EmptyView()
        }
    }
}
