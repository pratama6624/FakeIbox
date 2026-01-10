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
                    .padding(.bottom, -10)
                HomeCategoryView(categories: vm.categories)
                
                VStack(alignment: .leading, spacing: 12) {
                    SectionHeaderView(title: "Rekomendasi Terbaik")
                        .padding(.bottom, 10)

                    VStack(spacing: 10) {
                        ForEach(vm.recommendedVisible) { item in
                            RecommendedProductRow(item: item) {
                                vm.toggleWishlist(id: item.id)
                            }
                        }

                        Button(vm.showAllRecommended ? "Show Less" : "Show More") {
                            withAnimation(.easeOut(duration: 0.2)) {
                                vm.toggleShowMore()
                            }
                        }
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(.primary)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(
                            Capsule().fill(Color(.systemGray5))
                        )
                        .buttonStyle(.plain)
                        .padding(.top, 2)
                    }
                }
                .padding(.top, 6)

                FeatureGridView(items: vm.features)
                .padding(.top, 6)
                
            }
            .padding(.bottom, 20)
        }
        .scrollIndicators(.hidden)
        .onAppear { vm.load() }
    }
}
