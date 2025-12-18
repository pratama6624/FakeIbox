//
//  PageDots.swift
//  Ibox
//
//  Created by Pratama One on 16/12/25.
//

import Foundation
import SwiftUI


struct PageDots: View {
    let count: Int
    let index: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<count, id: \.self) { i in
                Capsule(style: .continuous)
                    .fill(i == index ? Color.black : Color(.systemGray3))
                    .frame(width: i == index ? 22 : 12, height: 6)
                    .animation(.easeOut(duration: 0.18), value: index)
            }
        }
    }
}
