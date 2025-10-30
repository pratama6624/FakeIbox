//
//  PaymentView.swift
//  Ibox
//
//  Created by Pratama One on 12/02/24.
//

import SwiftUI

struct PaymentView: View {
    
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "lock.rotation")
                Text("Secure Transactions")
                    .font(.callout)
            }
            .padding(.bottom, 30)
            .padding(.top, 15)
            
            VStack (alignment: .center){
                HStack {
                    Text("Delivery Address")
                        .font(.callout)
                }
                .padding(.top, 12)
                .padding(.bottom, 5)
                
                Text("Apt. 396 Jl. Jend. Sudirman No. 74, Ponorogo, SU 12541")
                    .padding(.all, 10)
                    .font(.caption)
                    .background(.fill)
            }
            .border(.gray, width: 1)
            .padding(.bottom, 20)
            
            Button(action: {}) {
                Text("Change Address")
                    .font(.caption)
                    .padding(.all, 10)
                    .border(.gray, width: 1)
                    .foregroundStyle(Color.black)
            }
            
            Spacer()
            
            VStack (spacing: 20) {
                Text("Shopping Summary")
                    .font(.callout)
                
                HStack {
                    Text("Order Total (2 Items)")
                        .font(.callout)
                    
                    Spacer()
                    
                    Text("$1.448")
                        .font(.callout)
                }
                
                HStack {
                    Text("Shipping costs")
                        .font(.callout)
                    
                    Spacer()
                    
                    Text("$0")
                        .font(.callout)
                }
                
                HStack {
                    Text("Total payment")
                        .font(.headline)
                    
                    Spacer()
                    
                    Text("$1.448")
                        .font(.headline)
                }
                
                HStack {
                    Spacer()
                    Text("Buy")
                        .font(.callout)
                        .padding(.horizontal, 13)
                        .padding(.vertical, 8)
                    Spacer()
                }
                .background(.fill)
            }
            .padding(.bottom, 50)
            .padding(.horizontal, 10)
        }
        .padding(.all, 20)
    }
}

#Preview {
    PaymentView()
}
