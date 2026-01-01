////
////  AuthContainerView.swift
////  Ibox
////
////  Created by Pratama One on 19/12/25.
////
//
//import Foundation
//import SwiftUI
//import AuthenticationServices
//
//struct AuthContainerView: View {
//    @StateObject private var vm = AuthViewModel()
//    @State private var form = AuthFormState()
//    @State private var route: AuthRoute = .login
//    
//    var body: some View {
//        NavigationStack {
//            content
//                .navigationBarTitleDisplayMode(.inline)
//                .onChange(of: route) { _, newValue in
//                    print("ROUTE CHANGED ->", String(describing: newValue))
//                }
//                .environmentObject(vm)
//        }
//    }
//    
//    @ViewBuilder
//    private var content: some View {
//        switch route {
//        case .login:
//            LoginView(navigate: { newRoute in route = newRoute })
//        case .register:
//            RegisterView(form: form, navigate: { newRoute in route = newRoute })
//        case .forgot:
//            LoginView(navigate: { newRoute in route = newRoute })
//            //            ForgotPasswordView(navigate: { newRoute in route = newRoute })
//        }
//    }
//}
//
