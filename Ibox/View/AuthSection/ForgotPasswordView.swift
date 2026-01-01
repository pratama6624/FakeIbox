//
//  ForgotPasswordView.swift
//  Ibox
//
//  Created by Pratama One on 21/12/25.
//

import SwiftUI
import AuthenticationServices

struct ForgotPasswordView: View {
    @ObservedObject var vm: AuthViewModel
    let navigate: (AuthRoute) -> Void
    
    var body: some View {
        Text("Login View")
    }
}

//#Preview {
//    ForgotPasswordView(vm: <#AuthViewModel#>, navigate: <#(AuthRoute) -> Void#>)
//}
