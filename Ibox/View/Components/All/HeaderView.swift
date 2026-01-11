//
//  HomeHeaderView.swift
//  Ibox
//
//  Created by Pratama One on 04/01/26.
//

import SwiftUI

struct HeaderView: View {
    var vm = SideMenuViewModel()
    let userName: String
    let onSearch: () -> Void
    let onNotification: () -> Void
    let onMenu: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(Color(.systemGray5))
                .frame(width: 30, height: 30)
                .overlay(
                    Image("profile.jpg")
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(10)
                )
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Hallo \(userName)!")
                    .font(.system(size: 14, weight: .bold))
            }
            
            Spacer()
            
            HStack(spacing: 14) {
                Button(action: onSearch) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 18, weight: .semibold))
                }
                Button(action: onNotification) {
                    Image(systemName: "bell")
                        .font(.system(size: 18, weight: .semibold))
                }
                Button(action: onMenu) {
                    Image(systemName: "list.bullet")
                        .font(.system(size: 18, weight: .semibold))
                }
            }
            .foregroundStyle(.primary)
            .buttonStyle(.plain)
        }
    }
}

