//
//  SliderImage.swift
//  Ibox
//
//  Created by Pratama One on 14/02/24.
//

import SwiftUI

struct CarouselSlider: View {
    @Binding var photos: [String]
    @Binding var frameHeight: CGFloat
    @Binding var isShadow: Bool
    @State var currentPage = 0
    
    var body: some View {
        TabView(selection: $currentPage) {
            ForEach(photos.indices, id: \.self) { photo in
                Image(photos[photo])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5)
                    .padding(.all, isShadow ? 5 : 0)
                    .shadow(color: Color.gray.opacity(isShadow ? 0.5 : 0), radius: 3, x: 0, y: 0)
            }
        }
        .tabViewStyle(.page)
        .frame(height: frameHeight)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
                withAnimation {
                    currentPage = (currentPage + 1) % photos.count
                }
            }
        }
    }
}

#Preview {
    CarouselSlider(photos: .constant(["", "", ""]), frameHeight: .constant(0), isShadow: .constant(false))
}
