//
//  AuthFlowView.swift
//  Ibox
//
//  Created by Pratama One on 31/12/25.
//

import SwiftUI

struct AuthFlowView: View {
    @EnvironmentObject private var router: AppRouter
    @StateObject private var vm = AuthViewModel()
    @State private var form = AuthFormState()
    
    var body: some View {
        NavigationStack(path: $router.authPath) {
            LoginView(
                navigate: { route in router.authPath.append(route) },
                onLoginSuccess: { router.goToMain() },
                onSkip: { router.goToMain() }
            )
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.clear, for: .navigationBar)
                .environmentObject(vm)
                .navigationDestination(for: AuthRoute.self) { route in
                    switch route {
                    case .login:
                        LoginView(
                            navigate: { r in router.authPath.append(r) },
                            onLoginSuccess: { router.goToMain() },
                            onSkip: { router.goToMain() }
                        )
                        .environmentObject(vm)

                    case .register:
                        RegisterView(
                            form: form,
                            navigate: { r in router.authPath.append(r) }
                        )
                        .environmentObject(vm)
                        
                    case .registerSuccess:
                        RegisterSuccessView(
                            navigate: { r in router.authPath.append(r) }
                        )

                    case .forgot:
                        ForgotPasswordView(
                            form: form,
                            navigate: { r in router.authPath.append(r) }
                        )
                        .environmentObject(vm)
                        
                    case .forgotSuccess:
                        ForgotPasswordSuccessView(
                            navigate: { r in router.authPath.append(r) }
                        )
                    }
                }
        }
    }
}

