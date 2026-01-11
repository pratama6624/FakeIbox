//
//  HomeCategoryView.swift
//  Ibox
//
//  Created by Pratama One on 09/01/26.
//
import SwiftUI

struct HomeCategoryView: View {
    let categories: [ProductCategory]

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(categories) { cat in
                    VStack(spacing: 8) {
                        Image(cat.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 59, height: 59)

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
        .padding(.bottom, 10)
    }
}
