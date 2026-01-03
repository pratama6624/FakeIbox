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
    case registerSuccess
}

// MARK: Auth Flow
enum AppFlow: Hashable {
    case onboarding // Welcome Section
    case auth // Auth Section
    case main // Home Section
}

@MainActor
final class AppRouter: ObservableObject {
    private let didFinishOnboardingKey = "didFinishOnboardingKey"
    
    @Published var flow: AppFlow = .auth
    @Published var authPath = NavigationPath()
    @Published var mainPath = NavigationPath()
    
    init() {
        let args = ProcessInfo.processInfo.arguments
        if args.contains("-resetOnboarding") {
            UserDefaults.standard.set(false, forKey: didFinishOnboardingKey)
        }
        
        let finished = UserDefaults.standard.bool(forKey: didFinishOnboardingKey)
        self.flow = finished ? .auth : .onboarding
    }
    
    func completeOnboarding() {
        UserDefaults.standard.set(true, forKey: didFinishOnboardingKey)
        authPath = NavigationPath()
        flow = .auth
    }
    
    func goToMain() {
        authPath = NavigationPath()
        flow = .main
    }
    
    func logout() {
        mainPath = NavigationPath()
        flow = .auth
    }
    
    // MARK: TESTING onboarding View
    func resetOnboarding() {
        UserDefaults.standard.set(false, forKey: didFinishOnboardingKey)
        flow = .onboarding
    }
}
