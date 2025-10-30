//
//  Service.swift
//  Ibox
//
//  Created by Pratama One on 15/02/24.
//

import SwiftUI

struct Service: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                VStack {
                    Image(systemName: "lock.shield")
                        .resizable()
                        .frame(width: 30, height: 35)
                        .padding(.horizontal, 15)
                    
                    Text("Official guarantee")
                        .font(.callout)
                        .bold()
                    Spacer()
                    Text("Official Warranty Product")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .bold()
                }
                .padding(.all, 15)
                .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                .background(.fill)
                .cornerRadius(10)
                
                VStack {
                    Image(systemName: "airpodsmax")
                        .resizable()
                        .frame(width: 30, height: 35)
                        .padding(.horizontal, 15)
                    
                    Text("Customer Care")
                        .font(.callout)
                        .bold()
                    Spacer()
                    Text("Our team is ready to help with products")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .bold()
                }
                .padding(.all, 15)
                .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                .background(.fill)
                .cornerRadius(10)
            }
            
            // 2
            HStack(spacing: 20) {
                VStack {
                    Image(systemName: "shippingbox")
                        .resizable()
                        .frame(width: 30, height: 35)
                        .padding(.horizontal, 15)
                    
                    Text("Delivery Service")
                        .font(.callout)
                        .bold()
                    Spacer()
                    Text("Trusted Delivery and Security")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .bold()
                }
                .padding(.all, 15)
                .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                .background(.fill)
                .cornerRadius(10)
                
                VStack {
                    Image(systemName: "gauge.open.with.lines.needle.33percent.and.arrowtriangle.from.0percent.to.50percent")
                        .resizable()
                        .frame(width: 30, height: 35)
                        .padding(.horizontal, 15)
                    
                    Text("Many Benefits")
                        .font(.callout)
                        .bold()
                    Spacer()
                    Text("Latest Promos and Info on Latest Products")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .bold()
                }
                .padding(.all, 15)
                .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                .background(.fill)
                .cornerRadius(10)
            }
        }
        .padding(.vertical, 20)
        .padding(.bottom, 15)
    }
}

#Preview {
    Service()
}
