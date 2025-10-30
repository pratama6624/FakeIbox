//
//  Pagination.swift
//  Ibox
//
//  Created by Pratama One on 15/02/24.
//

import SwiftUI

struct PaginationButton: View {
    let number: Int
    
    var body: some View {
        Button(action: {
            // Handle button tap
            print("Tapped on page \(number)")
        }) {
            Text("\(number)")
                .frame(width: 35, height: 35)
                .cornerRadius(5)
        }
        .background(.fill)
        .foregroundStyle(Color.black)
    }
}

#Preview {
    PaginationButton()
}
