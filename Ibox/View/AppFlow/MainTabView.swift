//
//  MainTapView.swift
//  Ibox
//
//  Created by Pratama One on 05/01/26.
//

import SwiftUI

enum MainTab {
    case home
    case product
    case cart
    case wislish
    case account
}

struct MainTabView: View {
    @StateObject private var vm = HomeViewModel()
    @State private var selectedTab: MainTab = .home
    @State var showMenu: Bool = false
    @Namespace private var indicatorNS
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            VStack {
                HomeHeaderView(
                    userName: vm.userName,
                    onSearch: vm.tapSearch,
                    onNotification: vm.tapNotifications,
                    onMenu: vm.tapMenu
                )
                .padding(.top, 8)
                .padding(.bottom, 20)
                
                contentForTap()
            }
        }
        .padding(.horizontal, 24)
        
        HStack(spacing: 0) {
            tabButton("Home", "house", .home, CGSize(width: 22, height: 19))
            tabButton("Produk", "list.bullet.below.rectangle", .product, CGSize(width: 19, height: 20))
            tabButton("Keranjang", "cart", .cart, CGSize(width: 22, height: 19))
            tabButton("Disukai", "heart", .wislish, CGSize(width: 22, height: 19))
            tabButton("Pratama", "person", .account, CGSize(width: 19, height: 20))
            
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .stroke(Color.black.opacity(0.08), lineWidth: 1)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(Color.white.opacity(0.25))
                )
                .shadow(color: .black.opacity(0.06), radius: 10, x: 0, y: 6)
        }
        .padding(.horizontal, 16)
        .padding(.bottom, -5)
    }
    
    @ViewBuilder
    private func contentForTap() -> some View {
        switch selectedTab {
        case .home:
            HomeView(onLogout: {})
        case .product:
            ProductView(onLogout: {})
        case .cart:
            CartView(onLogout: {})
        case .wislish:
            WislishView(onLogout: {})
        case .account:
            AccountView(onLogout: {})
        }
    }
    
    @ViewBuilder
    private func tabButton(_ title: String, _ icon: String, _ tab: MainTab, _ size: CGSize) -> some View {
        let isActive = (selectedTab == tab)
        
        Button {
            withAnimation(.spring(response: 0.08, dampingFraction: 0.85)) {
                selectedTab = tab
            }
        } label: {
            ZStack {
                if isActive {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemGray5))
                        .matchedGeometryEffect(id: "activeTabPill", in: indicatorNS)
                        .frame(height: 50)
                        .padding(.horizontal, 8)
                }
                
                VStack(spacing: 4) {
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: size.width, height: size.height)
                        .fontWeight(isActive ? .semibold : .regular)
                    
                    Text(title)
                        .font(.caption2)
                }
                .padding(.vertical, 6)
                .frame(maxWidth: .infinity)
            }
        }
        .buttonStyle(.plain)
        .foregroundStyle(isActive ? Color.black : Color.black.opacity(0.55))
        .contentShape(Rectangle())
    }
}
