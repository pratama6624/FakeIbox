//
//  PromoCarouselView.swift
//  Ibox
//
//  Created by Pratama One on 04/01/26.
//

import SwiftUI

struct PromoCarouselView: View {
    let promos: [PromoBanner]
    
    @State private var index: Int = 0
    
    var body: some View {
        VStack(spacing: 10) {
            TabView(selection: $index) {
                ForEach(Array(promos.enumerated()), id: \.offset) { i, promo in
                    Image(promo.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 180)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .tag(i)
                }
            }
            .frame(height: 180)
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            // Dots
            HStack(spacing: 6) {
                ForEach(0..<max(promos.count, 1), id: \.self) { i in
                    Capsule()
                        .fill(i == index ? Color.black : Color(.systemGray3))
                        .frame(width: i == index ? 18 : 6, height: 6)
                        .animation(.easeOut(duration: 0.18), value: index)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}
