//
//  Product.swift
//  Ibox
//
//  Created by Pratama One on 03/02/24.
//

import SwiftUI

struct ProductViewOld: View {
    @State private var porductController = ProductController()
    
    let column: [GridItem] = [
        GridItem(.fixed(UIScreen.main.bounds.width / 2.4), spacing: 20, alignment: nil),
        GridItem(.fixed(UIScreen.main.bounds.width / 2.4), spacing: nil, alignment: nil),
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            CategoryListHV()
            
            VStack {
                
                LazyVGrid(
                    columns: column,
                    alignment: .center,
                    spacing: 1,
                    pinnedViews: [],
                    content: {
                        ForEach(self.porductController.products, id: \.id) {
                            product in
                            ProductViewItem(product: product)
                        }
                    }
                )
                .onAppear {
                    self.porductController.fetchProduct()
                }
            }
            .padding(.horizontal, 4)
            
            HStack {
                ForEach(1...5, id: \.self) { pageNumber in
                    PaginationButton(number: pageNumber)
                }
            }
            .padding(.bottom, 10)
        }
        .padding(.bottom, 50)
    }
}

#Preview {
    ProductViewOld()
}

struct ProductViewItem: View {
    var product: ProductModel
    @State private var showDetailProduct = false
    
    var body: some View {
        Button(action: {
            withAnimation {
                showDetailProduct.toggle()
            }
        }) {
            VStack(alignment: .leading) {
                ZStack(alignment: .bottomLeading) {
                    Image(product.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width / 2.3)
                        .padding(.bottom, 10)
                    
                    Color.black.opacity(0.1)
                    
                    HStack {
                        Text("\(product.discount)%")
                            .padding(.all, 5)
                            .background(.red)
                            .foregroundStyle(.white)
                            .font(.headline)
                            .cornerRadius(5)
                            .opacity(product.discount == 0 ? 0 : 1)
                        
                        Spacer()
                        
                        Image(systemName: product.like ? "heart" : "heart.fill")
                            .padding(.all, 7)
                            .background(.white)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .foregroundColor(product.like ? Color.black : Color.red)
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                }
                .cornerRadius(10)
                .padding(.bottom, 10)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(product.categoryName)
                        .font(.headline)
                    
                    Text(product.productName)
                        .font(.callout)
                    
                    Text(product.description)
                        .font(.callout)
                        .padding(.bottom, 5)
                    
                    HStack(spacing: 10) {
                        if product.discount > 0 {
                            Text("$\(product.price)")
                                .font(.headline)
                                .foregroundStyle(Color.red)
                                .bold()
                                .strikethrough(true, color: .red)
                        }
                        
                        Text("$719")
                            .font(.headline)
                            .bold()
                    }
                }
                .padding(.leading, 10)
            }
            .padding(.bottom, 30)
        }
        .foregroundColor(.black)
        .popover(isPresented: $showDetailProduct, arrowEdge: .top ) {
            GeometryReader { geometry in
                ProductDetailViewOld()
            }
        }
    }
}

struct PaginationButton: View {
    let number: Int
    
    var body: some View {
        Button(action: {
            // Handle button tap
            print("Tapped on page \(number)")
        }) {
            Text("\(number)")
                .frame(width: 35, height: 35)
                .cornerRadius(5)
        }
        .background(.fill)
        .foregroundStyle(Color.black)
    }
}
