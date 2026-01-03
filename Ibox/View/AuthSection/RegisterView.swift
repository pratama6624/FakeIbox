//
//  RegisterView.swift
//  Ibox
//
//  Created by Pratama One on 05/02/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var vm: RegisterViewModel
    @ObservedObject private var form: AuthFormState
    
    let navigate: (AuthRoute) -> Void
    
    init(
        form sharedForm: AuthFormState,
        service: AuthServicing = MockAuthService(),
        navigate: @escaping (AuthRoute) -> Void
    ) {
        _vm = StateObject(wrappedValue: RegisterViewModel(form: sharedForm, service: service))
        _form = ObservedObject(wrappedValue: sharedForm)
        self.navigate = navigate
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {

                BrandHeader()
                
                Text("Daftar akun")
                    .font(.system(size: 30, weight: .bold))
                    .padding(.top, 40)
                    .padding(.bottom, 10)
                
                VStack(spacing: 12) {
                    AuthTextField(
                        placeholder: "Nama depan",
                        text: $form.firstName,
                        error: vm.errors[.firstname],
                        keyboard: .namePhonePad
                    )
                    .padding(.bottom, 10)
                    
                    AuthTextField(
                        placeholder: "Nama belakang",
                        text: $form.lastName,
                        error: vm.errors[.lastname],
                        keyboard: .namePhonePad
                    )
                    .padding(.bottom, 10)
                    
                    AuthTextField(
                        placeholder: "No. handphone",
                        text: $form.nohandphone,
                        error: vm.errors[.handphone],
                        keyboard: .numberPad
                    )
                    .padding(.bottom, 10)
                    
                    AuthTextField(
                        placeholder: "Email",
                        text: $form.email,
                        error: vm.errors[.email],
                        keyboard: .namePhonePad
                    )
                    .padding(.bottom, 10)
                    
                    AuthPasswordField(
                        placeholder: "Password",
                        text: $form.password,
                        isVisible: $form.isPasswordVisible,
                        error: vm.errors[.password]
                    )
                    .padding(.bottom, 10)
                    
                    AuthPasswordField(
                        placeholder: "Konfirmasi Password",
                        text: $form.confirmPassword,
                        isVisible: $form.isPasswordVisible,
                        error: vm.errors[.confirmPassword]
                    )
                    .padding(.bottom, 10)
                    
                    AuthCheckboxRow(
                        isChecked: $form.agreeToTerms,
                        text: "Setuju dengan semua ketentuan di",
                        underlinedTail: "iBoc."
                    )
                }
                
                AuthPrimaryButton(title: "Daftar", isLoading: vm.isLoading) {
                    Task {
                        let ok = await vm.register()
                        if ok { navigate(.registerSuccess) }
                    }
                }
                .padding(.top, 16)
                
                Text("Atau")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(Color(.systemGray))
                    .padding(.top, 16)
                
                AuthOutlineButton(title: "Sign in with Google") {
                    // TODO: Integrate provider
                }
                .padding(.top, 16)
                
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
                
                Button("Sudah punya akun?") {
                    navigate(.login)
                }
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(Color.blue)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 16)
                
                Spacer(minLength: 5)
                
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
//    RegisterView(vm: <#AuthViewModel#>, navigate: <#(AuthRoute) -> Void#>)
//}

