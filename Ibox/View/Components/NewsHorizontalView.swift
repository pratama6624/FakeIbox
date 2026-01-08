//
//  NewsHorizontalView.swift
//  Ibox
//
//  Created by Pratama One on 05/01/26.
//

import SwiftUI

struct NewsHorizontalView: View {
    let items: [NewsItem]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(items) { item in
                    ZStack(alignment: .bottomLeading) {
                        Image(item.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 208, height: 104)
                            .clipped()
                            .overlay(
                                Color.black.opacity(0.28)
                            )
                        
                        Text(item.title)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 12)
                            .padding(.bottom, 10)
                            .shadow(radius: 6)
                            .multilineTextAlignment(.center)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                }
            }
            .padding(.vertical, 2)
        }
        .scrollIndicators(.hidden)
        .padding(.bottom, 16)
    }
}
