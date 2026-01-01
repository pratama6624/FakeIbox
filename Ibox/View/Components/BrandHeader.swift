//
//  AuthBrandHeader.swift
//  Ibox
//
//  Created by Pratama One on 21/12/25.
//

import SwiftUI
import AuthenticationServices

struct BrandHeader: View {
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Spacer()
                
                Text("iBoc")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(.primary)
                
                HStack(spacing: 8) {
                    Image(systemName: "applelogo")
                        .font(.system(size: 31, weight: .semibold))
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Premium")
                        Text("Partner")
                    }
                    .font(.system(size: 14, weight: .semibold))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
                
                Spacer()
            }
        }
    }
}
