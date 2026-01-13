//
//  ProductBenefitRow.swift
//  Ibox
//
//  Created by Pratama One on 12/01/26.
//

import SwiftUI

struct ProductBenefitRow: View {
    let benefits: [ProductBenefit]
    
    var body: some View {
        HStack(spacing: 18) {
            ForEach(benefits) { b in
                HStack(spacing: 8) {
                    Image(systemName: b.systemIcon)
                        .font(.system(size: 15, weight: .semibold))
                    Text(b.title)
                        .font(.system(size: 10, weight: .semibold))
                }
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .padding(.vertical, 6)
    }
}
