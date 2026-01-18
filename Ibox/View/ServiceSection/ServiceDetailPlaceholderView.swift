//
//  ServiceDetailPlaceholderView.swift
//  Ibox
//
//  Created by Pratama One on 18/01/26.
//

import SwiftUI

struct ServiceDetailPlaceholderView: View {
    let route: ServiceRoute
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            
            Text("Halaman ini placeholder. Nanti isi konten sesuai layanan.")
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

            Spacer()
        }
        .padding(.top, 20)
        .navigationTitle(route.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
