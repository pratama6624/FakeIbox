//
//  SideMenuItem.swift
//  Ibox
//
//  Created by Pratama One on 11/01/26.
//

import Foundation

struct SideMenuItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let systemImage: String
    let route: SideMenuRoute
}
