//
//  FeatureGridView.swift.swift
//  Ibox
//
//  Created by Pratama One on 07/01/26.
//

import SwiftUI

struct FeatureGridView: View {
    let items: [HomeFeature]
    
    private let cols = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    var body: some View {
        LazyVGrid(columns: cols, spacing: 12) {
            ForEach(items) { f in
                FeatureCardView(feature: f)
            }
        }
    }
}

struct FeatureCardView: View {
    let feature: HomeFeature
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: feature.iconName)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.primary)

            Text(feature.title)
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(.primary)
                .multilineTextAlignment(.center)

            Text(feature.subtitle)
                .font(.system(size: 11, weight: .medium))
                .foregroundStyle(Color(.secondaryLabel))
                .multilineTextAlignment(.center)
                .lineSpacing(2)
        }
        .frame(maxWidth: .infinity, minHeight: 92)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color(.systemGray6))
        )
    }
}
