//
//  ServiceModels.swift
//  Ibox
//
//  Created by Pratama One on 18/01/26.
//

import Foundation

enum ServiceRoute: String, Hashable, CaseIterable, Identifiable {
    case customerSevice = "Layanan Pelanggan"
    case business = "Bisnis"
    case financing = "Financing"
    case tradeIn = "Trade-in"
    case upgrade = "Upgrade"
    case inStoreClasses = "In-Store Classes"
    case appleCareService = "AppleCare Service"
    case appleCareProtection = "AppleCare Protection"
    case iProtect = "IProtect"
    case servicePricing = "Harga Jasa Service"
    case serviceLocation = "Lokasi Service"

    var id: String { rawValue }
    var title: String { rawValue }
}
