//
//  LoginVew.swift
//  Ibox
//
//  Created by Pratama One on 05/02/24.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @StateObject private var vm: LoginViewModel
    @ObservedObject private var form: AuthFormState
    
    let navigate: (AuthRoute) -> Void
    let onLoginSuccess: () -> Void
    let onSkip: () -> Void
    
    init(
        service: AuthServicing = MockAuthService(),
        navigate: @escaping (AuthRoute) -> Void,
        onLoginSuccess: @escaping () -> Void,
        onSkip: @escaping () -> Void
    ) {
        let sharedForm = AuthFormState()
        _vm = StateObject(wrappedValue: LoginViewModel(form: sharedForm, service: service))
        _form = ObservedObject(wrappedValue: sharedForm)
        self.navigate = navigate
        self.onLoginSuccess = onLoginSuccess
        self.onSkip = onSkip
    }
       
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {

                BrandHeader()
                
                Text("Masuk")
                    .font(.system(size: 30, weight: .bold))
                    .padding(.top, 40)
                    .padding(.bottom, 10)
                    
                VStack(spacing: 12) {
                    AuthTextField(
                        placeholder: "Email atau no. handphone",
                        text: $form.emailOrPhone,
                        error: vm.errors[.emailOrPhone],
                        keyboard: .emailAddress
                    )
                    .padding(.bottom, 10)
                    
                    AuthPasswordField(
                        placeholder: "Password",
                        text: $form.password,
                        isVisible: $form.isPasswordVisible,
                        error: vm.errors[.password]
                    )
                    
                    if let msg = vm.errorMessage {
                        AuthErrorBanner(message: msg)
                    }
                }
                
                Button("Lupa password?") {
                    navigate(.forgot)
                }
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(Color.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 16)
                
                HStack(spacing: 18) {
                    AuthPrimaryButton(title: "Masuk", isLoading: vm.isLoading) {
                        Task {
                            let ok = await vm.login()
                            if ok { onLoginSuccess() }
                        }
                    }
                    AuthSecondaryButton(title: "Lewati") {
                        onSkip()
                    }
                }
                .padding(.top, 16)
                
                Button("Daftar akun") {
                    navigate(.register)
                }
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(Color.blue)
                .padding(.top, 16)
                
                VStack(spacing: 12) {
                    AuthOutlineButton(title: "Sign in with Google") {
                        // TODO: Integrate provider
                    }
                     
                    AuthApppleSignInButton { request in
                        request.requestedScopes = [.fullName, .email]
                    } completion: { result in
                        switch result {
                        case .success(let auth):
                            print((auth))
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
                .padding(.top, 16)
                
                Spacer(minLength: 10)
                
                Text("iBoc adalah Apple Premium Reseller terkemuka di Indonesia yang mengkhususkan diri dalam produk-produk Apple dan berbagai macam aksesoris pelengkap, software dan produk lainnya")
                    .font(.system(size: 15))
                    .foregroundStyle(.primary.opacity(0.85))
                    .multilineTextAlignment(.center)
                    .padding(.top, 18)
                    .padding(.horizontal, 16)
                
                Spacer(minLength: 24)
            }
            .padding(.horizontal, 24)
        }
        .scrollIndicators(.hidden)
    }
}

//#Preview {
//    LoginView(vm: <#AuthViewModel#>, navigate: <#(AuthRoute) -> Void#>)
//}

