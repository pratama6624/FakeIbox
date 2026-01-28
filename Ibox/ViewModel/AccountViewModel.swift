//
//  AccountViewModel.swift
//  Ibox
//
//  Created by Pratama One on 26/01/26.
//

import SwiftUI

@MainActor
final class AccountViewModel: ObservableObject {
    @Published var sections: [AccountMenuSection]
    
    init() {
        self.sections = [
            .init(items: [
                .init(icon: "person.text.rectangle", title: "Dashboard Akun", route: .accountDashboard),
                .init(icon: "person.circle", title: "Informasi Akun", route: .accountInformation),
                .init(icon: "clock.arrow.trianglehead.counterclockwise.rotate.90", title: "Riwayat Transaksi", route: .history),
                .init(icon: "mappin.and.ellipse", title: "Daftar Alamat", route: .accountAddress),
                .init(icon: "rectangle.portrait.and.arrow.right", title: "Keluar", route: .logout)
            ])        ]
    }
}
