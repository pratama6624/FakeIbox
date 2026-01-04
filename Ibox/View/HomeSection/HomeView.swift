//
//  HomeView.swift
//  Ibox
//
//  Created by Pratama One on 27/12/25.
//

import SwiftUI

struct HomeView: View {
    let onLogout: () -> Void
    @StateObject private var vm = HomeViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                
                HomeHeaderView(
                    userName: vm.userName,
                    onSearch: vm.tapSearch,
                    onNotification: vm.tapNotifications,
                    onMenu: vm.tapMenu
                )
                .padding(.top, 8)
                
                // Pilih toko
                Button {
                    vm.tapSelectStore()
                } label: {
                    HStack(spacing: 8) {
                        Image(systemName: "house")
                        Text(vm.selectedStore)
                            .font(.system(size: 16, weight: .semibold))
                    }
                    .foregroundStyle(.primary)
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.plain)
                
                PromoCarouselView(promos: vm.promos)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 20)
        }
        .scrollIndicators(.hidden)
        .onAppear { vm.load() }
    }
}
