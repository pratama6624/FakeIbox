//
//  OnboardingViewModel.swift
//  Ibox
//
//  Created by Pratama One on 16/12/25.
//

import Foundation

final class OnboardingViewModel: ObservableObject {
    @Published var items: [OnboardingItem]
    @Published var index: Int = 0
    
    private let onFinish: (() -> Void)?
    
    init(items: [OnboardingItem], onFinish: (() -> Void)? = nil) {
        self.items = items
        self.onFinish = onFinish
    }
    
    var isLast: Bool { index >= items.count - 1 }
    
    func next() {
        if isLast {
            onFinish?()
        } else {
            index += 1
        }
    }
    
    func skipToEnd() {
        index = max(items.count - 1, 0)
    }
}
