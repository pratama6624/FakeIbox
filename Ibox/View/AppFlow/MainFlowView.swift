//
//  MainFlowView.swift
//  Ibox
//
//  Created by Pratama One on 01/01/26.
//

import SwiftUI

struct MainFlowView: View {
    @EnvironmentObject private var router: AppRouter
    
    var body: some View {
        NavigationStack(path: $router.mainPath) {
            HomeView(
                onLogout: { router.logout() }
            )
        }
    }
}
