//
//  SideMenuView.swift
//  Ibox
//
//  Created by Pratama One on 11/01/26.
//

import SwiftUI

struct SideMenuView: View {
    @ObservedObject var vm: SideMenuViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            header
            
            VStack(spacing: 18) {
                ForEach(vm.primaryItems) { item in
                    SideMenuRow(
                        title: item.title,
                        systemImage: item.systemImage,
                        onTap: { vm.select(item.route) },
                        route: item.route
                    )
                }
            }
            .padding(.top, 16)
            
            Divider().opacity(0.2).padding(.vertical, 6)

            VStack(alignment: .leading, spacing: 15) {
                ForEach(vm.secondaryItems) { item in
                    SideMenuRow(
                        title: item.title,
                        systemImage: item.systemImage,
                        onTap: { vm.select(item.route) },
                        route: item.route
                    )
                    .padding(.bottom, 3)
                    .font(.system(size: 15, weight: .semibold))
                }
            }

            Spacer(minLength: 6)

            languagePicker

            socialRow

            Text("Versi Aplikasi 1.0.0")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .padding(.bottom, 8)
        }
        .padding(.horizontal, 18)
        .padding(.top, 22)
        .padding(.bottom, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
    }
    
    private var header: some View {
        HStack(alignment: .center, spacing: 12) {
            Circle()
                .fill(Color(.systemGray5))
                .frame(width: 30, height: 30)
                .overlay(
                    Image(vm.avatarSystemImage)
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(10)
                )
            
            Text(vm.userName)
                .font(.title3.weight(.bold))
            
            Spacer()
            
            Button(action: { vm.logoutTapped() }) {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .font(.system(size: 18, weight: .semibold))
            }
            .buttonStyle(.plain)
            .padding(.trailing, 20)
        }
    }
    
    private var languagePicker: some View {
        Menu {
            Picker("Bahasa", selection: $vm.language) {
                ForEach(SideMenuViewModel.AppLanguage.allCases) { lang in
                    Text(lang.rawValue).tag(lang)
                }
            }
        } label: {
            HStack {
                Text(vm.language.rawValue)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(.primary)
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(Color(.secondarySystemBackground))
            )
        }
    }
    
    private var socialRow: some View {
        HStack(spacing: 16) {
            SocialIconButton(systemImage: "applelogo") { /* TODO */ }
            SocialIconButton(systemImage: "play.rectangle") { /* TODO */ }
            SocialIconButton(systemImage: "camera") { /* TODO */ }
            SocialIconButton(systemImage: "xmark") { /* TODO */ }
        }
        .padding(.top, 6)
    }
}

private struct SideMenuRow: View {
    let title: String
    let systemImage: String
    let onTap: () -> Void
    let route: SideMenuRoute

    var body: some View {
        Button {
            onTap()
        } label: {
            HStack(spacing: 14) {
                Image(systemName: systemImage)
                    .font(.system(size: 17, weight: .semibold))
                    .frame(width: 26, alignment: .leading)

                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.primary)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.secondary)
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

private struct SocialIconButton: View {
    let systemImage: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(.system(size: 18, weight: .semibold))
                .frame(width: 44, height: 44)
                .background(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(Color(.secondarySystemBackground))
                )
        }
        .buttonStyle(.plain)
    }
}
