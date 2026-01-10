//
//  WislishView.swift
//  Ibox
//
//  Created by Pratama One on 05/02/24.
//

import SwiftUI

struct WislishViewOld: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("My Wislish")
                .font(.headline)
                .padding(.vertical, 10)
            
            VStack {
                HStack {
                    Image("ip154")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 95, height: 70)
                        .clipped()
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        Text("IPhone 15 Pro Max")
                            .font(.callout)
                            .padding(.vertical, 3)
                        
                        HStack {
                            Button(action: {
                                
                            }) {
                                Text("Remove")
                                    .font(.caption)
                                    .foregroundStyle(Color.black)
                            }
                            .padding(.trailing, 20)
                            
                            Button(action: {
                                
                            }) {
                                Text("Move to shopping cart")
                                    .font(.caption)
                                    .foregroundStyle(Color.black)
                            }
                        }
                    }
                    
                    Spacer()
                }
            }
            .padding(.all, 10)
            .border(Color.gray, width: 0.5)
            
            // 2
            VStack {
                HStack {
                    Image("m3spaceblack")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 95, height: 70)
                        .clipped()
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        Text("Macbook Pro M3 14\"")
                            .font(.callout)
                            .padding(.vertical, 3)
                        
                        HStack {
                            Button(action: {
                                
                            }) {
                                Text("Remove")
                                    .font(.caption)
                                    .foregroundStyle(Color.black)
                            }
                            .padding(.trailing, 20)
                            
                            Button(action: {
                                
                            }) {
                                Text("Move to shopping cart")
                                    .font(.caption)
                                    .foregroundStyle(Color.black)
                            }
                        }
                    }
                    
                    Spacer()
                }
            }
            .padding(.all, 10)
            .border(Color.gray, width: 0.5)
            
            // 3
            VStack {
                HStack {
                    Image("airpodspro2")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 95, height: 70)
                        .clipped()
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        Text("Airpods Pro Gen 2 Type-C")
                            .font(.callout)
                            .padding(.vertical, 3)
                        
                        HStack {
                            Button(action: {
                                
                            }) {
                                Text("Remove")
                                    .font(.caption)
                                    .foregroundStyle(Color.black)
                            }
                            .padding(.trailing, 20)
                            
                            Button(action: {
                                
                            }) {
                                Text("Move to shopping cart")
                                    .font(.caption)
                                    .foregroundStyle(Color.black)
                            }
                        }
                    }
                    
                    Spacer()
                }
            }
            .padding(.all, 10)
            .border(Color.gray, width: 0.5)
        }
    }
}

#Preview {
    WislishViewOld()
}
