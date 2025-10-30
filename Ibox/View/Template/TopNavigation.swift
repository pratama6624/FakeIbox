//
//  TopNavigation.swift
//  Ibox
//
//  Created by Pratama One on 03/02/24.
//

import SwiftUI

struct TopNavigation: View {
    @Binding var showMenu: Bool
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack(spacing: 20) {
            HStack (spacing: 15) {
                if selectedTab == .payment {
                    Image(systemName: "arrow.backward")
                        .bold()
                        .frame(width: 20, height: 32)
                        .cornerRadius(10)
                } else {
                    Image("yujin")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .cornerRadius(10)
                }
                
                VStack(alignment: .leading) {
                    Text(selectedTab != .cart ? "Hello Pratama!" : "Shopping Cart")
                        .font(.headline)
                }
            }
            Spacer()
            
            Button(action: {print("To Search")}) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .bold()
            }
            .foregroundStyle(Color.black)
            
            Button(action: {print("To Search")}) {
                ZStack(alignment: .topTrailing){
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text("5")
                        .frame(width: 10, height: 10)
                        .padding(.all, 3)
                        .background(Color.red)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(Color.white)
                        .font(.caption2)
                        .bold()
                        .padding(.top, -5)
                        .padding(.trailing, -5)
                }
            }
            .foregroundStyle(Color.black)
            
            Button(action: {
                withAnimation{
                    showMenu.toggle()
                }
            }) {
                Image(systemName: "list.bullet")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .bold()
            }
            .foregroundStyle(Color.black)
        }
        .padding(.bottom, 10)
    }
}

#Preview {
    TopNavigation(showMenu: .constant(false), selectedTab: .constant(.home))
}
