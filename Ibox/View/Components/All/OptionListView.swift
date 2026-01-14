//
//  OptionListView.swift
//  Ibox
//
//  Created by Pratama One on 14/01/26.
//

import SwiftUI

struct OptionListView: View {
    let title: String
    let options: [OptionItem]
    let selectedIndex: Int
    let onSelect: (Int) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
            
            VStack(spacing: 10) {
                ForEach(Array(options.enumerated()), id: \.offset) { idx, opt in
                    Button {
                        onSelect(idx)
                    } label: {
                        HStack {
                            Text(opt.title)
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundStyle(.primary)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 12)
                        .frame(height: 42)
                        .background(
                            RoundedRectangle(cornerRadius: 6, style: .continuous)
                                .stroke(idx == selectedIndex ? Color.black.opacity(0.35) : Color(.systemGray3), lineWidth: idx == selectedIndex ? 1.5 : 1)
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}
