//
//  ProductView.swift
//  Ibox
//
//  Created by Pratama One on 05/01/26.
//

import SwiftUI

struct ProductView: View {
    let onLogout: () -> Void
    @StateObject private var vm = HomeViewModel()
    @StateObject private var pvm = ProductViewModel()
    
    private let topID = "TOP_ANCHOR"
    
    private let cols: [GridItem] = [
        GridItem(.flexible(), spacing: 7),
        GridItem(.flexible(), spacing: 7)
    ]
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                Color.clear
                    .frame(height: 1)
                    .id(topID)
                
                VStack(alignment: .leading, spacing: 18) {
                    CategoryRowView(categories: vm.categories, selected: $pvm.selectedCategory) { cat in
                        pvm.selectCategory(cat)
                    }
                    .padding(.top, 8)
                    
                    LazyVGrid(columns: cols, spacing: 7) {
                        ForEach(pvm.items) { item in
                            ProductCardView(item: item) {
                                pvm.toggleWishlist(id: item.id)
                            }
                        }
                    }
                    .padding(.bottom, 10)
                    
                    VStack(spacing: 16) {
    //                    Text("Halaman: \($pvm.page)")
                        
                        PaginationView(totalPages: pvm.totalPage, currentPage: $pvm.page) { newPage in
                            pvm.goToPage(newPage)
                        }
                    }
                    .padding()
                    
                    FeatureGridView(items: vm.features)
                    .padding(.top, 6)
                    .padding(.bottom, 16)
                }
                .onAppear {
                    pvm.load()
                    vm.load()
                }
                .onChange(of: pvm.page) { _, _ in
                    withAnimation(.easeOut(duration: 0.25)) {
                        proxy.scrollTo(topID, anchor: UnitPoint.top)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}
