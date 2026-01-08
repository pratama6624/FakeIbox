//
//  Untitled.swift
//  Ibox
//
//  Created by Pratama One on 04/01/26.
//

import SwiftUI

struct SectionHeaderView: View {
    let title: String
    var trailingTitle: String? = nil
    var onTapTrailing: (() -> Void)? = nil
    
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            Text(title)
                .font(.system(size: 17, weight: .bold))
            
            Spacer()
            
            if let trailingTitle {
                Button(trailingTitle) { onTapTrailing?() }
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(Color(.systemGray))
                    .buttonStyle(.plain)
            }
        }
    }
}
