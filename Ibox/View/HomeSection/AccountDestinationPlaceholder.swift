//
//  AccountDestinationPlaceholder.swift
//  Ibox
//
//  Created by Pratama One on 26/01/26.
//

import SwiftUI

struct AccountDestinationPlaceholder: View {
    let route: AccountRoute
    
    var title: String {
        switch route {
            
        case .accountDashboard:
            "Dashboard Akun"
        case .accountInformation:
            "Informasi Akun"
        case .history:
            "Riwayat Transaksi"
        case .accountAddress:
            "Daftar Alamat"
        case .logout:
            "Keluar"
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .font(.system(size: 22, weight: .bold))
            Text("Placeholder page")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding(.top, 20)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
