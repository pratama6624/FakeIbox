//
//  ColorSwatchesView.swift
//  Ibox
//
//  Created by Pratama One on 14/01/26.
//

import SwiftUI

struct ColorSwatchesView: View {
    let options: [ColorOption]
    let selectedIndex: Int
    let onSelect: (Int) -> Void
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(Array(options.enumerated()), id: \.offset) { idx, opt in
                Button {
                    onSelect(idx)
                } label: {
                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                        .fill(opt.color)
                        .frame(width: 26, height: 26)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6, style: .continuous)
                                .stroke(idx == selectedIndex ? Color.black.opacity(0.35) : Color.black.opacity(0.12), lineWidth: idx == selectedIndex ? 2 : 1)
                        )
                }
                .buttonStyle(.plain)
            }
        }
    }
}
