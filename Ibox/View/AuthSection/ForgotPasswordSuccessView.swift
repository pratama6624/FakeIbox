//
//  ForgotPasswordSuccessView.swift
//  Ibox
//
//  Created by Pratama One on 03/01/26.
//

import SwiftUI
import AuthenticationServices

struct ForgotPasswordSuccessView: View {
    let navigate: (AuthRoute) -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                
                BrandHeader()
                
                Spacer()
                
                Text("Ubah Password")
                    .font(.system(size: 30, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 16)
                
                Text("Link reset password berhasil, cek email untuk melakukan reset")
                    .font(.system(size: 15, weight: .medium))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 16)
                
                AuthPrimaryButton(title: "Masuk", isLoading: false) {
                    // Action to login after reset
                    Task {
                        navigate(.login)
                    }
                }
                .padding(.bottom, 16)
                
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
