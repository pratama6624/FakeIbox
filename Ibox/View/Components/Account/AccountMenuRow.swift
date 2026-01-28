//
//  AccountMenuRow.swift
//  Ibox
//
//  Created by Pratama One on 26/01/26.
//

import SwiftUI

struct AccountMenuRow: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color(.systemGray6))
                    .frame(width: 40, height: 40)
                
                Image(systemName: icon)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(Color(.label))
            }
            
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.primary)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(Color(.systemGray3))
        }
        .frame(height: 58)
        .background(Color.white.opacity(0.001))
    }
}
