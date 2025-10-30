//
//  Product.swift
//  Ibox
//
//  Created by Pratama One on 03/02/24.
//

import SwiftUI

struct back: View {
    @State private var porductController = ProductController()
    
    let column: [GridItem] = [
        GridItem(.fixed(UIScreen.main.bounds.width / 2), spacing: nil, alignment: nil),
        GridItem(.fixed(UIScreen.main.bounds.width / 2), spacing: nil, alignment: nil),
    ]
    
    var body: some View {
        CategoryListHV()
        
//        VStack(spacing: 30) {
//            ForEach(porductController.products, id: \.id) {
//                product in
//                HStack {
//                    VStack(alignment: .leading) {
//                        ZStack(alignment: .bottomLeading) {
//                            Image(product.image)
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: UIScreen.main.bounds.width / 2.4)
//                                .padding(.bottom, 10)
//
//                            Color.black.opacity(0.1)
//
//                            HStack {
//                                Text("\(product.discount)%")
//                                    .padding(.all, 5)
//                                    .background(.red)
//                                    .foregroundStyle(.white)
//                                    .font(.headline)
//                                    .cornerRadius(5)
//
//                                Spacer()
//
//                                Image(systemName: "heart")
//                                    .padding(.all, 7)
//                                    .background(.white)
//                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//                            }
//                            .padding(.horizontal, 10)
//                            .padding(.bottom, 10)
//                        }
//                        .cornerRadius(10)
//
//                        VStack(alignment: .leading, spacing: 5) {
//                            Text(product.categoryName)
//                                .font(.headline)
//
//                            Text(product.productName)
//                                .font(.callout)
//
//                            Text(product.description)
//                                .font(.callout)
//                                .padding(.bottom, 5)
//
//                            HStack(spacing: 10) {
//                                Text("$799")
//                                    .font(.headline)
//                                    .foregroundStyle(Color.red)
//                                    .bold()
//                                    .strikethrough(true, color: .red)
//
//                                Text("$719")
//                                    .font(.headline)
//                                    .bold()
//                            }
//                        }
//                        .padding(.leading, 10)
//                    }
//
//                    Spacer()
//
//                    VStack(alignment: .leading) {
//                        ZStack(alignment: .bottomLeading) {
//                            Image(product.image)
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: UIScreen.main.bounds.width / 2.4)
//                                .padding(.bottom, 10)
//
//                            Color.black.opacity(0.1)
//
//                            HStack {
//                                Text("\(product.discount)%")
//                                    .padding(.all, 5)
//                                    .background(.red)
//                                    .foregroundStyle(.white)
//                                    .font(.headline)
//                                    .cornerRadius(5)
//
//                                Spacer()
//
//                                Image(systemName: "heart")
//                                    .padding(.all, 7)
//                                    .background(.white)
//                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//                            }
//                            .padding(.horizontal, 10)
//                            .padding(.bottom, 10)
//                        }
//                        .cornerRadius(10)
//
//                        VStack(alignment: .leading, spacing: 5) {
//                            Text(product.categoryName)
//                                .font(.headline)
//
//                            Text(product.productName)
//                                .font(.callout)
//
//                            Text(product.description)
//                                .font(.callout)
//                                .padding(.bottom, 5)
//
//                            HStack(spacing: 10) {
//                                Text("$799")
//                                    .font(.headline)
//                                    .foregroundStyle(Color.red)
//                                    .bold()
//                                    .strikethrough(true, color: .red)
//
//                                Text("$719")
//                                    .font(.headline)
//                                    .bold()
//                            }
//                        }
//                        .padding(.leading, 10)
//                    }
//
//                    .padding(.all, 1)
//                    .cornerRadius(10)
//                }
//            }
//        }
//        .onAppear {
//            self.porductController.fetchProduct()
//        }
        
        LazyVGrid(
            columns: column,
            alignment: .center,
            spacing: 1,
            pinnedViews: [],
            content: {
                VStack(alignment: .leading) {
                    ZStack(alignment: .bottomLeading) {
                        Image("ip15promax")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width / 2.4)
                            .padding(.bottom, 10)
                        
                        Color.black.opacity(0.1)
                        
                        HStack {
                            Text("10%")
                                .padding(.all, 5)
                                .background(.red)
                                .foregroundStyle(.white)
                                .font(.headline)
                                .cornerRadius(5)
                            
                            Spacer()
                            
                            Image(systemName: "heart")
                                .padding(.all, 7)
                                .background(.white)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.horizontal, 10)
                        .padding(.bottom, 10)
                    }
                    .cornerRadius(10)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("IPhone")
                            .font(.headline)
                        
                        Text("IPhone 15 Pro Max")
                            .font(.callout)
                        
                        Text("16 Gb / 1024 Gb")
                            .font(.callout)
                            .padding(.bottom, 5)
                        
                        HStack(spacing: 10) {
                            Text("$799")
                                .font(.headline)
                                .foregroundStyle(Color.red)
                                .bold()
                                .strikethrough(true, color: .red)
                            
                            Text("$719")
                                .font(.headline)
                                .bold()
                        }
                    }
                    .padding(.leading, 10)
                }
            })
    }
}

#Preview {
    back()
}



