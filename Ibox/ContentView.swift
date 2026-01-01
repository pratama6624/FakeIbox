//
//  ContentView.swift
//  Ibox
//
//  Created by Pratama One on 02/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .home
    @State private var secondView = false
    @State var showMenu: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            
            VStack {
                TopNavigation(showMenu: $showMenu, selectedTab: $selectedTab)
                    .padding(.horizontal, 20)
                
                contentViewForTab()
                    .padding(.horizontal, 20)
            }
            
            HStack(spacing: 35) {
                Spacer()
                
                Button(action: {
                    $selectedTab.wrappedValue = Tab.home
                }) {
                    VStack {
                        Image(systemName: "house")
                            .resizable()
                            .frame(width: 22, height: 19)
                        
                        Text("Home")
                            .font(.caption2)
                    }
                }
                .foregroundStyle(.black)
                
                Button(action: {
                    $selectedTab.wrappedValue = Tab.product
                }) {
                    VStack {
                        Image(systemName: "list.bullet.below.rectangle")
                            .resizable()
                            .frame(width: 19, height: 20)
                        
                        Text("Product")
                            .font(.caption2)
                    }
                }
                .foregroundStyle(Color.black)
                
                Button(action: {
                    $selectedTab.wrappedValue = Tab.cart
                }) {
                    VStack {
                        ZStack(alignment: .topTrailing){
                            Image(systemName: "cart")
                                .resizable()
                                .frame(width: 22, height: 19)
                            
                            Text("2")
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
                        
                        Text("Cart")
                            .font(.caption2)
                    }
                }
                .foregroundStyle(Color.black)
                
                Button(action: {
                    $selectedTab.wrappedValue = Tab.wislish
                }) {
                    VStack {
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 22, height: 19)
                        
                        Text("Wislish")
                            .font(.caption2)
                    }
                }
                .foregroundStyle(Color.black)
                
                Button(action: {
                    $selectedTab.wrappedValue = Tab.account
                }) {
                    VStack{
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 22, height: 19)
                        
                        Text("You")
                            .font(.caption2)
                    }
                }
                .foregroundStyle(Color.black)
                
                Spacer()
            }
            .padding(.top, 35)
            .padding(.bottom, 10)
            .frame(height: 50)
            .background(.white)
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: -4)
            
            GeometryReader { _ in
                HStack {
                    SideMenu()
                        .offset(x: showMenu ? 0 : -UIScreen.main.bounds.width)
                    
                    Spacer()
                }
            }
        }
    }
    
    @ViewBuilder
    private func contentViewForTab() -> some View {
        switch selectedTab {
            case .home:
                HomeViewOld()
            case .product:
                ProductView()
            case .cart:
                CartView()
            case .account:
                AccountView()
            case .payment:
                PaymentView()
            case .wislish:
                WislishView()
        }
    }
}

#Preview {
    ContentView()
}

enum Tab {
    case home
    case product
    case cart
    case account
    case payment
    case wislish
}

struct SecondView: View {
    var body: some View {
        VStack {
            // Your content for the second view
            
            Text("This is the Second View")
                .padding()
            
            Button("Dismiss") {
                // Tindakan saat tombol di tampilan kedua ditekan
                // Anda dapat menambahkan logika khusus di sini sebelum menutup tampilan kedua
            }
            .padding()
        }
        .navigationTitle("Second View")
    }
}
