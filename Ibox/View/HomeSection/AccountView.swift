//
//  AccountView.swift
//  Ibox
//
//  Created by Pratama One on 05/01/26.
//

import SwiftUI

struct AccountView: View {
    let onLogout: () -> Void
    @StateObject private var vm = HomeViewModel()
    @StateObject private var accountModel = AccountViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 14) {
                    
                    VStack(spacing: 14) {
                        ForEach(accountModel.sections) { section in
                            VStack(spacing: 2) {
                                ForEach(section.items) { item in
                                    NavigationLink(value: item.route) {
                                        AccountMenuRow(icon: item.icon, title: item.title)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }
                    }
                    .padding(.top, 4)
                    .padding(.bottom, 16)
                    
                    AccountSupportCard()
                        .padding(.bottom, 20)
                    
                    FeatureGridView(items: vm.features)
                        .padding(.bottom, 20)
                }
            }
            .scrollIndicators(.hidden)
            .onAppear { vm.load() }
            .navigationDestination(for: AccountRoute.self) { route in
                AccountDestinationPlaceholder(route: route)
            }
        }
    }
}
