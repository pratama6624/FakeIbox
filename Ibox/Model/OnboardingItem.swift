//
//  OnboardingItem.swift
//  Ibox
//
//  Created by Pratama One on 16/12/25.
//

import Foundation

struct OnboardingItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
}
