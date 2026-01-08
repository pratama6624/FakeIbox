//
//  RatingStarsView.swift
//  Ibox
//
//  Created by Pratama One on 07/01/26.
//

import SwiftUI

struct RatingStarsView: View {
    let rating: Int // 0...6
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<5, id: \.self) { i in
                Image(systemName: i < rating ? "star.fill" : "star")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundStyle(.primary)
                    .opacity(i < rating ? 1 : 0.35)
            }
        }
    }
}
