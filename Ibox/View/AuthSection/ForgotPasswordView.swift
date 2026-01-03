//
//  ForgotPasswordView.swift
//  Ibox
//
//  Created by Pratama One on 21/12/25.
//

import SwiftUI
import AuthenticationServices

struct ForgotPasswordView: View {
    @StateObject private var vm: ResetPasswordViewModel
    @ObservedObject private var form: AuthFormState
    
    let navigate: (AuthRoute) -> Void
    
    init(
        form sharedForm: AuthFormState,
        service: AuthServicing = MockAuthService(),
        navigate: @escaping (AuthRoute) -> Void
    ) {
        _vm =  StateObject(wrappedValue: ResetPasswordViewModel(form: sharedForm, service: service))
        _form = ObservedObject(wrappedValue: sharedForm)
        self.navigate = navigate
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                
                BrandHeader()
                
                Spacer()
                
                Text("Ubah Password")
                    .font(.system(size: 30, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 16)
                
                Text("Kode OTP akan dikirim ke email untuk reset password")
                    .font(.system(size: 15, weight: .medium))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 16)
                
                VStack(spacing: 12) {
                    AuthTextField(
                        placeholder: "Email atau no. handphone",
                        text: $form.emailOrPhone,
                        error: vm.errors[.emailOrPhone],
                        keyboard: .emailAddress
                    )
                    
                    if let msg = vm.errorMessage {
                        AuthErrorBanner(message: msg)
                    }
                }
                .padding(.bottom, 16)
                
                AuthPrimaryButton(title: "Submit", isLoading: vm.isLoading) {
                    // Action to send reset password
                    Task {
                        let ok = await vm.sendResetLink()
                        // Sampai sini bree. kalo bagian ini harusnya mengembalikan error jika salah balikan dari fungsi di view Model nya tapi jika berhasil harusnya mengembalikan pesan berhasil mengirim link ke email yang diinput dibawahnya. ok
                        
                        // Dan juga disini harusnya langsung respon ketika link dari reset password berhasil diperbarui oleh user ketika user kembali ke halaman ini
                        if ok {
                            navigate(.forgotSuccess)
                        }
                    }
                }
                .padding(.bottom, 16)
                
                Button {
                    Task {
                        navigate(.login)
                    }
                } label: {
                    Text("Kembali")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(.blue)
                }
                
                Spacer()
                
                Text("iBoc adalah Apple Premium Reseller terkemuka di Indonesia yang mengkhususkan diri dalam produk-produk Apple dan berbagai macam aksesoris pelengkap, software dan produk lainnya")
                    .font(.system(size: 15))
                    .foregroundStyle(.primary.opacity(0.85))
                    .multilineTextAlignment(.center)
                    .padding(.top, 18)
                    .padding(.horizontal, 16)
            }
            .padding(.horizontal, 24)
            .containerRelativeFrame(.vertical, alignment: .center)
        }
        .scrollIndicators(.hidden)
    }
}

//#Preview {
//    ForgotPasswordView(vm: <#AuthViewModel#>, navigate: <#(AuthRoute) -> Void#>)
//}
