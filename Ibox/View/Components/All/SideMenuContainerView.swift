//
//  SideMenuContainerView.swift
//  Ibox
//
//  Created by Pratama One on 11/01/26.
//

import SwiftUI

@MainActor
struct SideMenuContainerView<Content: View>: View {
    @StateObject var vm: SideMenuViewModel
    private let content: () -> Content
    
    init(vm: SideMenuViewModel? = nil, @ViewBuilder content: @escaping () -> Content) {
        _vm = StateObject(wrappedValue: vm ?? SideMenuViewModel())
        self.content = content
    }
    
    private let menuWidthRatio: CGFloat = 0.75

    var body: some View {
        GeometryReader { geo in
            let menuWidth = geo.size.width * menuWidthRatio

            ZStack(alignment: .leading) {

                content()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .offset(x: vm.isOpen ? menuWidth : 0)
                    .disabled(vm.isOpen)

                if vm.isOpen {
                    Color.black.opacity(0.25)
                        .ignoresSafeArea()
                        .onTapGesture { vm.close() }
                        .transition(.opacity)
                }

                SideMenuView(vm: vm)
                    .frame(width: menuWidth)
                    .background(Color(.systemBackground))
                    .clipShape(
                        UnevenRoundedRectangle(
                            cornerRadii: .init(
                                topLeading: 0,
                                bottomLeading: 0,
                                bottomTrailing: 56,
                                topTrailing: 56
                            )
                        )
                    )
                    .overlay(
                        UnevenRoundedRectangle(
                            cornerRadii: .init(
                                topLeading: 0,
                                bottomLeading: 0,
                                bottomTrailing: 56,
                                topTrailing: 56
                            )
                        )
                        .stroke(Color.black.opacity(0.06), lineWidth: 1)
                    )
                    .offset(x: vm.isOpen ? 0 : -menuWidth)
                    .shadow(color: .black.opacity(0.10), radius: 18, x: 10, y: 0)
            }
            .gesture(
                DragGesture(minimumDistance: 10)
                    .onEnded { value in
                        // swipe right opens, swipe left closes
                        if value.translation.width > 60 { vm.open() }
                        if value.translation.width < -60 { vm.close() }
                    }
            )
            .animation(.spring(response: 0.35, dampingFraction: 0.9), value: vm.isOpen)
        }
    }
}

