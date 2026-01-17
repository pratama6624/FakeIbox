//
//  QuantityStepperView.swift
//  Ibox
//
//  Created by Pratama One on 15/01/26.
//

import SwiftUI

struct QuantityStepperView: View {
    let title: String
    let value: Int
    let onMinus: () -> Void
    let onPlus: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
            
            HStack {
                Button(action: onMinus) {
                    Text("-")
                        .font(.system(size: 18, weight: .bold))
                        .frame(width: 52, height: 44)
                }
                .buttonStyle(.plain)
                
                Spacer()
                
                Text("\(value)")
                    .font(.system(size: 16, weight: .semibold))
                
                Spacer()
                
                Button(action: onPlus) {
                    Text("+")
                        .font(.system(size: 18, weight: .bold))
                        .frame(width: 52, height: 44)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 6)
            .frame(height: 42)
            .background(
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .stroke(Color(.systemGray3), lineWidth: 1)
            )
        }
    }
}
