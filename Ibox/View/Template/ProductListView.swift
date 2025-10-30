//
//  ProductList.swift
//  Ibox
//
//  Created by Pratama One on 03/02/24.
//

import SwiftUI

struct ProductListView: View {
    var body: some View {
        VStack {
            ZStack{
                HStack(spacing: 20) {
                    Image("air15")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 95, height: 70)
                        .clipped()
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Macbook Air 15\"")
                                .font(.callout)
                                .bold()
                            
                            Spacer()
                            
                            Image(systemName: "heart")
                        }
                        
                        Text("8/256 Starlight")
                            .font(.callout)
                            .padding(.bottom, 5)
                        
                        HStack {
                            Text("$1.099")
                                .bold()
                            
                            Spacer()
                            
                            HStack {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(Color.orange)
                                
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(Color.orange)
                                
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(Color.orange)
                                
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(Color.orange)
                                
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(Color.orange)
                            }
                        }
                    }
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 15)
                
                Color.gray.opacity(0.2)
            }
            .cornerRadius(10)
            .padding(.bottom, 10)
            
            ZStack{
                HStack(spacing: 20) {
                    Image("m2pro")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 95, height: 70)
                        .clipped()
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Macbook Pro M2 13\"")
                                .font(.callout)
                                .bold()
                            
                            Spacer()
                            
                            Image(systemName: "heart")
                        }
                        
                        Text("8/256 Gray")
                            .font(.callout)
                            .padding(.bottom, 5)
                        
                        HStack {
                            Text("$1.399")
                                .bold()
                            
                            Spacer()
                            
                            HStack {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(Color.orange)
                                
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(Color.orange)
                                
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(Color.orange)
                                
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(Color.orange)
                                
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(Color.orange)
                            }
                        }
                    }
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 15)
                
                Color.gray.opacity(0.2)
            }
            .cornerRadius(10)
            .padding(.bottom, 10)
            
            ZStack{
                HStack(spacing: 20) {
                    Image("m2pro")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 95, height: 70)
                        .clipped()
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Macbook Pro M2 13\"")
                                .font(.callout)
                                .bold()
                            
                            Spacer()
                            
                            Image(systemName: "heart")
                        }
                        
                        Text("8/256 Gray")
                            .font(.callout)
                            .padding(.bottom, 5)
                        
                        HStack {
                            Text("$1.399")
                                .bold()
                            
                            Spacer()
                            
                            HStack {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(Color.orange)
                                
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(Color.orange)
                                
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(Color.orange)
                                
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(Color.orange)
                                
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(Color.orange)
                            }
                        }
                    }
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 15)
                
                Color.gray.opacity(0.2)
            }
            .cornerRadius(10)
            .padding(.bottom, 10)
        }
    }
}

#Preview {
    ProductListView()
}
