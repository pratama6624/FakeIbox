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
    @StateObject private var pvm = RecommendedViewModel()
    
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
                    .padding(.bottom, -10)
                HomeCategoryView(categories: vm.categories)
                
                VStack(alignment: .leading, spacing: 12) {
                    SectionHeaderView(title: "Rekomendasi Terbaik")
                        .padding(.bottom, 10)

                    RecommendedSectionView(items: pvm.recommended) { item in
                        pvm.buyNow(item)
                    }
                    .padding(.top, 6)
                }
                .padding(.top, 6)

                FeatureGridView(items: vm.features)
                .padding(.top, 6)
                
            }
            .padding(.bottom, 20)
        }
        .scrollIndicators(.hidden)
        .onAppear {
            vm.load()
            pvm.loadRecommeded()
        }
    }
}
