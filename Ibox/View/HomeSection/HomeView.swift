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
                
                // Pilih toko
                Button {
                    vm.tapSelectStore()
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "house")
                            .font(.system(size: 14))
                            .padding(.bottom, 2)
                        Text(vm.selectedStore)
                            .font(.system(size: 15, weight: .bold))
                    }
                    .foregroundStyle(.primary)
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.plain)
                
                // Banner Home
                PromoCarouselView(promos: vm.promos)
                
                // News
                SectionHeaderView(
                    title: "Berita terbaru",
                    trailingTitle: "Lihat semua",
                    onTapTrailing: vm.tapSeeAllNews
                )
                NewsHorizontalView(items: vm.news)
                
                // Categories
                SectionHeaderView(title: "Berbagai Produk Apple")
                CategoryRowView(categories: vm.categories)
            }
            .padding(.bottom, 20)
        }
        .scrollIndicators(.hidden)
        .onAppear { vm.load() }
    }
}
