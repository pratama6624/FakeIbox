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
    
    private let cols: [GridItem] = [
        GridItem(.flexible(), spacing: 14),
        GridItem(.flexible(), spacing: 14)
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                
                CategoryRowView(categories: vm.categories)
                
            }
            .onAppear { vm.load() }
            
            LazyVGrid(columns: cols, spacing: 14) {
                ForEach(pvm.items) { item in
                    ProductCardView(item: item) {
                        vm.toggleWishlist(id: item.id)
                    }
                }
            }
            .padding(.top, 12)
            .padding(.bottom, 20)
        }
        .scrollIndicators(.hidden)
        .onAppear { pvm.load() }
    }
}
