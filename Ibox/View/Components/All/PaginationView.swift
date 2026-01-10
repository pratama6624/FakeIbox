//
//  PaginationView.swift
//  Ibox
//
//  Created by Pratama One on 09/01/26.
//

import SwiftUI

struct PaginationView: View {
    let totalPages: Int
    @Binding var currentPage: Int
    var onChange: ((Int) -> Void)? = nil
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(1...max(totalPages, 1), id: \.self) { page in
                Button {
                    guard page != currentPage else { return }
                    currentPage = page
                    onChange?(page)
                } label: {
                    Text("\(page)")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.black)
                        .frame(width: 34, height: 28)
                        .background(
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(page == currentPage ? Color(.systemGray4) : Color(.systemGray6))
                        )
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
    }
}
