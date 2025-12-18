//
//  OnBoardingFlowView.swift
//  Ibox
//
//  Created by Pratama One on 16/12/25.
//

import Foundation
import SwiftUI

struct OnBoardingFlowView: View {
    @StateObject private var vm: OnboardingViewModel
    
    init(onFinish: (() -> Void)? = nil) {
        let items: [OnboardingItem] = [
            .init(
                title: "Selamat datang",
                subtitle: "Produk Apple Terbaru\nTemukan katalog lengkap dan selalu update.",
                imageName: "onboarding1"
            ),
            .init(
                title: "Selamat datang",
                subtitle: "Dengalaman Belanja Premium\nesain minimalis, harga transparan.",
                imageName: "onboarding2"
            ),
            .init(
                title: "Selamat datang",
                subtitle: "Tersebar di berbagai kota\n\"Jankauan luas, akses fleksibel. Belanja online dari\nmana saja atau kunjungi toko offline kami\".",
                imageName: "onboarding3"
            )
        ]
        
        _vm = StateObject(wrappedValue: OnboardingViewModel(items: items, onFinish: onFinish))
    }
    
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            
            VStack(spacing: 0) {
                topBar
                    .padding(.top, 45)
                    .padding(.horizontal, 18)
                
                TabView(selection: $vm.index) {
                    ForEach(Array(vm.items.enumerated()), id: \.offset) { i, item in
                        OnboardingPageView(item: item)
                            .tag(i)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))

                bottomBar
                    .padding(.horizontal, 22)
                    .padding(.bottom, 22)
                    .padding(.top, 10)
                
                Spacer()
            }
        }
    }
    
    private var topBar: some View {
        VStack {
            HStack(spacing: 12) {
                Spacer()
                
                Text("iBoc")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(.primary)
                
                HStack(spacing: 8) {
                    Image(systemName: "applelogo")
                        .font(.system(size: 31, weight: .semibold))
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Premium")
                        Text("Partner")
                    }
                    .font(.system(size: 14, weight: .semibold))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
                
                Spacer()
            }
        }
    }

    private var bottomBar: some View {
        HStack {
            PageDots(count: vm.items.count, index: vm.index)
                .padding(.leading, 25)

            Spacer()

            Button {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.9)) {
                    vm.next()
                }
            } label: {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.black)
                    .frame(width: 69, height: 32)
                    .overlay {
                        if vm.isLast {
                            Text("Mulai")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(.white)
                        } else {
                            Image(systemName: "arrow.right")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.white)
                        }
                    }
            }
            .buttonStyle(.plain)
            .accessibilityLabel(vm.isLast ? "Start" : "Next")
            .padding(.trailing, 25)
        }
    }
}

#Preview {
    OnBoardingFlowView(onFinish: { print("Finished onboarding") })
}
