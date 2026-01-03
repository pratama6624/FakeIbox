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
        Text("Login View")
    }
}

//#Preview {
//    ForgotPasswordView(vm: <#AuthViewModel#>, navigate: <#(AuthRoute) -> Void#>)
//}
