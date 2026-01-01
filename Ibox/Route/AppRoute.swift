//
//  AppRoute.swift
//  Ibox
//
//  Created by Pratama One on 30/12/25.
//

import SwiftUI

enum AppRoute: Hashable {
    case auth(AuthRoute)
//    case home(HomeRoute)
//    case product(ProductRoute)
//    case transaction(TransactionRoute)
}

// MARK: Auth Route
enum AuthRoute: Hashable {
    case login
    case register
    case forgot
}

// MARK: Auth Flow
enum AppFlow: Hashable {
    case auth // Auth Section
    case main // Home Section
}

@MainActor
final class AppRouter: ObservableObject {
    @Published var flow: AppFlow = .auth
    @Published var authPath = NavigationPath()
    @Published var mainPath = NavigationPath()
    
    func goToMain() {
        authPath = NavigationPath()
        flow = .main
    }
    
    func logout() {
        mainPath = NavigationPath()
        flow = .auth
    }
}
