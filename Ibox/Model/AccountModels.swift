//
//  AccountModels.swift
//  Ibox
//
//  Created by Pratama One on 26/01/26.
//

import SwiftUI

enum AccountRoute: Hashable {
    case accountDashboard
    case accountInformation
    case history
    case accountAddress
    case logout
}

struct AccountMenuItem: Identifiable, Hashable {
    let id = UUID()
    let icon: String
    let title: String
    let route: AccountRoute
}

struct AccountMenuSection: Identifiable, Hashable {
    let id = UUID()
    let items: [AccountMenuItem]
}
