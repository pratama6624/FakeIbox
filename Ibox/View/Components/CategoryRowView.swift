//
//  CategoryRowView.swift
//  Ibox
//
//  Created by Pratama One on 05/01/26.
//

import SwiftUI

struct CategoryRowView: View {
    let categories: [ProductCategory]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(categories) { cat in
                    VStack(spacing: 8) {
                        Image(cat.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 61)
                        
                        Text(cat.title)
                            .font(.system(size: 14, weight: .bold))
                        
                        Text(cat.subtitle)
                            .font(.system(size: 11, weight: .medium))
                            .foregroundStyle(Color(.secondaryLabel))
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.vertical, 2)
        }
        .scrollIndicators(.hidden)
        .padding(.bottom, 16)
    }
}
