//
//  SliderImage.swift
//  Ibox
//
//  Created by Pratama One on 13/01/26.
//

import SwiftUI

struct SliderImageView: View {
    let images: [SliderImage]
    
    @State private var index: Int = 0
    
    var body: some View {
        VStack(spacing: 10) {
            TabView(selection: $index) {
                ForEach(Array(images.enumerated()), id: \.offset) { i, image in
                    Image(image.imageName)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .tag(i)
                }
            }
            .frame(height: 300)
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            // Dots
            HStack(spacing: 6) {
                ForEach(0..<max(images.count, 1), id: \.self) { i in
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
