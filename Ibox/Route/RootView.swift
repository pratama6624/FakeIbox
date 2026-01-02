//
//  RootView.swift
//  Ibox
//
//  Created by Pratama One on 31/12/25.
//

import SwiftUI

struct RootView: View {
    @StateObject private var router = AppRouter()
    
    var body: some View {
        Group {
            switch router.flow {
            case .onboarding:
                OnBoardingFlowView(onFinish: {
                    router.completeOnboarding()
                })
            case .auth:
                AuthFlowView()
                    .environmentObject(router)
            case .main:
                MainFlowView()
                    .environmentObject(router)
            }
        }
    }
}
