//
//  Home.swift
//  Ibox
//
//  Created by Pratama One on 03/02/24.
//

import SwiftUI

struct HomeViewOld: View {
    @State var photos = ["mac.m216", "macm1max", "macm1pro", "macm2pro"]
    @State private var frameHeight: CGFloat = 200
    @State private var isShadow: Bool = false
    
    let onLogout: () -> Void
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ZStack(alignment: .leading) {
                  CarouselSlider(photos: $photos, frameHeight: $frameHeight, isShadow: $isShadow)
                    
                    Color.black.opacity(0.3)
                        .frame(height: 200)
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        Image("iboxImage")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .cornerRadius(15)
                            .padding(.bottom, 5)
                        
                        Text("Discover Your")
                            .font(.title3)
                            .foregroundStyle(Color.white)
                            .bold()
                        
                        Text("Device selection")
                            .font(.callout)
                            .foregroundStyle(Color.white)
                            .bold()
                            .padding(.bottom, 5)
                        
                        Button(action: {print("Shop")}) {
                            Text("Shop now")
                                .font(.caption)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .background(Color.black)
                                .foregroundStyle(Color.white)
                                .cornerRadius(20)
                        }
                    }
                    .padding(.leading, 20)
                }
                .padding(.top, 5)
                
                HStack {
                    Text("Apple News")
                        .font(.title3)
                        .bold()
                    
                    Spacer()
                    
                    Text("See all")
                }
                .padding(.top, 30)
                .padding(.bottom, 20)
                
                HStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack (spacing: 20) {
                            ZStack(alignment: .bottomLeading) {
                                Image("visionpro")
                                    .resizable()
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .frame(width: 240, height: 120)
                                    .clipped()
                                    .cornerRadius(10)
                                
                                Color.black.opacity(0.3)
                                    .frame(height: 120)
                                    .cornerRadius(10)
                                
                                Text("Era of spatial computing")
                                    .font(.headline)
                                    .foregroundStyle(Color.white)
                                    .bold()
                                    .padding(.leading, 15)
                                    .padding(.bottom, 15)
                            }
                            
                            ZStack(alignment: .bottomLeading) {
                                Image("airpods")
                                    .resizable()
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .frame(width: 240, height: 120)
                                    .clipped()
                                    .cornerRadius(10)
                                
                                Color.black.opacity(0.3)
                                    .frame(height: 120)
                                    .cornerRadius(10)
                                
                                Text("Sound all around")
                                    .font(.headline)
                                    .foregroundStyle(Color.white)
                                    .bold()
                                    .padding(.leading, 15)
                                    .padding(.bottom, 15)
                            }
                            
                            ZStack(alignment: .bottomLeading) {
                                Image("ip15")
                                    .resizable()
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .frame(width: 240, height: 120)
                                    .clipped()
                                    .cornerRadius(10)
                                
                                Color.black.opacity(0.3)
                                    .frame(height: 120)
                                    .cornerRadius(10)
                                
                                Text("Titanium Pro")
                                    .font(.headline)
                                    .foregroundStyle(Color.white)
                                    .bold()
                                    .padding(.leading, 15)
                                    .padding(.bottom, 15)
                            }
                        }
                    }
                    .frame(height: 120)
                    .padding(.bottom, 20)
                }
                
                CategoryListHV()
                
                ProductListView()
                
                Button(action: {
                    
                }) {
                    Text("Show More")
                        .font(.callout)
                        .bold()
                }
                .foregroundStyle(Color.black)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(.fill)
                .cornerRadius(5)
                .padding(.bottom, 10)
                
                Service()
            }
            .padding(.bottom, 10)
        }
        .padding(.bottom, 50)
    }
}

//#Preview {
//    HomeViewOld()
//}
