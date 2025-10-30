//
//  SideMenu.swift
//  Ibox
//
//  Created by Pratama One on 04/02/24.
//

import SwiftUI

struct SideMenu: View {
    var body: some View {
        ZStack{
            VStack(alignment: .leading) {
                Spacer()
                
                HStack(spacing: 10) {
                    Image("yujin")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(20)
                    
                    Text("Pratama")
                        .font(.headline)
                        .padding(.bottom, 1)
                    
                    Spacer()
                    
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .resizable()
                        .frame(width: 25, height: 22)
                        .bold()
                    
                }
                .padding(.bottom, 50)
                
                VStack(alignment: .leading, spacing: 25) {
                    HStack(spacing: 20) {
                        Image(systemName: "person.crop.rectangle")
                            .resizable()
                            .frame(width: 22, height: 18)
                        
                        Text("Profile")
                            .font(.headline)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                    
                    HStack(spacing: 20) {
                        Image(systemName: "envelope")
                            .resizable()
                            .frame(width: 22, height: 18)
                        
                        Text("News")
                            .font(.headline)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                    
                    HStack(spacing: 20) {
                        Image(systemName: "list.bullet.below.rectangle")
                            .resizable()
                            .frame(width: 22, height: 18)
                        
                        Text("Product")
                            .font(.headline)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                    
                    HStack(spacing: 20) {
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 22, height: 18)
                        
                        Text("Wishlist")
                            .font(.headline)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                    
                    HStack(spacing: 20) {
                        Image(systemName: "cart")
                            .resizable()
                            .frame(width: 22, height: 18)
                        
                        Text("Cart")
                            .font(.headline)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                    
                    HStack(spacing: 20) {
                        Image(systemName: "gearshape.arrow.triangle.2.circlepath")
                            .resizable()
                            .frame(width: 22, height: 18)
                        
                        Text("HaloBox")
                            .font(.headline)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                    
                    HStack(spacing: 20) {
                        Image(systemName: "clock.arrow.circlepath")
                            .resizable()
                            .frame(width: 22, height: 18)
                        
                        Text("Activity")
                            .font(.headline)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Offline Store")
                        .font(.callout)
                    
                    Text("Customer Service")
                        .font(.callout)
                    
                    Text("Settings")
                        .font(.callout)
                        .padding(.bottom, 10)
                    
                    HStack {
                        Text("English")
                            .font(.callout)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(.fill)
                    .cornerRadius(5)
                }
                .padding(.bottom, 15)
                
                HStack(spacing: 20) {
                    Spacer()
                    
                    Image("apple")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Image("youtube")
                        .resizable()
                        .frame(width: 30, height: 40)
                    
                    Image("instagram")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Image("twitterx")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Spacer()
                }
                
                Spacer()
                
                Text("App Version 1.0.01")
                    .font(.caption)
                    .bold()
                
                Spacer()
                
            }
            .padding(.horizontal, 30)
            .frame(width: UIScreen.main.bounds.width - 100)
            .background(Color.white)
            
            Color.gray.opacity(0.1)
                .frame(width: UIScreen.main.bounds.width - 100)
        }
        .cornerRadius(30)
        .ignoresSafeArea()
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 0)
    }
}

#Preview {
    SideMenu()
}
