//
//  ServiceCenterView.swift
//  Ibox
//
//  Created by Pratama One on 18/01/26.
//

import SwiftUI

struct ServiceCenterView: View {
    @StateObject private var vm = ServiceCenterViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(vm.items, id: \.self) { route in
                    NavigationLink(value: route) {
                        ServiceOutlineRow(title: route.title)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 20)
        }
        .scrollIndicators(.hidden)
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: ServiceRoute.self) { route in
            ServiceDetailPlaceholderView(route: route)
        }
    }
}
