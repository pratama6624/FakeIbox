//
//  ServiceCenterViewModel.swift
//  Ibox
//
//  Created by Pratama One on 18/01/26.
//

import SwiftUI

@MainActor
final class ServiceCenterViewModel: ObservableObject {
    @Published var items: [ServiceRoute] = ServiceRoute.allCases
}
