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
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                
                Text("Account View")
                
            }
            .padding(.bottom, 20)
        }
        .scrollIndicators(.hidden)
        .onAppear { vm.load() }
    }
}
