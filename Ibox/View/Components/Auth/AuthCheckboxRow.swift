//
//  AuthCheckboxRow.swift
//  Ibox
//
//  Created by Pratama One on 27/12/25.
//

import SwiftUI

struct AuthCheckboxRow: View {
    @Binding var isChecked: Bool
    let text: String
    let underlinedTail: String?
    
    var body: some View {
        Button {
            isChecked.toggle()
        } label: {
            HStack(alignment: .center, spacing: 12) {
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .stroke(Color(.systemGray3), lineWidth: 1)
                    .frame(width: 18, height: 18)
                    .overlay {
                        if isChecked {
                            Image(systemName: "checkmark")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundStyle(.blue)
                        }
                    }
                Group {
                    if let underlinedTail {
                        (Text(text) + Text(" ") + Text(underlinedTail).underline())
                    } else {
                        Text(text)
                    }
                }
                .font(.system(size: 14))
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .buttonStyle(.plain)
    }
}
