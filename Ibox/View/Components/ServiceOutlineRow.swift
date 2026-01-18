//
//  ServiceOutlineRow.swift
//  Ibox
//
//  Created by Pratama One on 18/01/26.
//

import SwiftUI

struct ServiceOutlineRow: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.primary)
            
            Spacer()
        }
        .padding(.horizontal, 14)
        .frame(height: 44)
        .background(
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(Color(.systemGray3), lineWidth: 1)
        )
    }
}
