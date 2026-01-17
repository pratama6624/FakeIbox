//
//  ProductDescriptionSection.swift
//  Ibox
//
//  Created by Pratama One on 16/01/26.
//

import SwiftUI

struct ProductDescriptionSection: View {
    let description: String
    let features: [String]
    let package: [String]
    let warranty: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button("Ringkasan") {}
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(.blue)
                .buttonStyle(.plain)
                .padding(.top, 10)
            
            Text("Deskripsi")
                .font(.system(size: 18, weight: .bold))
            
            Text(description)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.primary)
                .lineSpacing(3)
            
            // Fitur
            ProductDescriptionList(title: "Fitur", components: features)
            
            // Package
            ProductDescriptionList(title: "Paket Pembelian", components: package)
            
            // Warranty
            ProductDescriptionList(title: "Garansi", components: warranty)
        }
    }
}

struct ProductDescriptionList: View {
    let title: String
    let components: [String]
    
    var body: some View {
        Text(title)
            .font(.system(size: 18, weight: .bold))
            .padding(.top, 20)
        
        VStack(alignment: .leading, spacing: 12) {
            ForEach(components, id: \.self) { f in
                HStack(alignment: .top, spacing: 10) {
                    Text("-")
                        .font(.system(size: 14, weight: .bold))
                        .padding(.top, 1)
                    Text(f)
                        .font(.system(size: 12, weight: .regular))
                        .lineSpacing(3)
                }
            }
        }
    }
}
