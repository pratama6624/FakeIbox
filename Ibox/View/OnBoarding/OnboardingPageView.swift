//
//  OnboardingPageView.swift
//  Ibox
//
//  Created by Pratama One on 16/12/25.
//

import Foundation
import SwiftUI

struct OnboardingPageView: View {
    let item: OnboardingItem
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            GeometryReader { geo in
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width - 20, height: geo.size.height)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .clipped()
            }
            .frame(height: 360)
            .padding(.horizontal, 14)
            
            VStack(spacing: 12) {
                Text(item.title)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(.primary)

                Text(item.subtitle)
                    .font(.system(size: 14))
                    .foregroundStyle(Color(.secondaryLabel))
                    .multilineTextAlignment(.center)
                    .lineSpacing(3)
            }
            .padding(.horizontal, 24)
            .padding(.top, 15)

            Spacer()
            Spacer()
        }
    }
}
