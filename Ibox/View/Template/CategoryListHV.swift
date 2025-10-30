//
//  CategoryListHV.swift
//  Ibox
//
//  Created by Pratama One on 03/02/24.
//

import SwiftUI

struct CategoryListHV: View {
    @State private var selectedCategory: String = "Alls"
    
    let data: [CategoryModel] = [
        CategoryModel(id: 1, categoryName: "Alls"),
        CategoryModel(id: 2, categoryName: "Vision Pro"),
        CategoryModel(id: 3, categoryName: "Mac"),
        CategoryModel(id: 4, categoryName: "IPad"),
        CategoryModel(id: 5, categoryName: "IPhone"),
        CategoryModel(id: 6, categoryName: "Watch"),
        CategoryModel(id: 7, categoryName: "TV & Home"),
        CategoryModel(id: 8, categoryName: "Accessories")
    ]
    
    var body: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    
                    ForEach(data) { category in
                        Button(action: {
                            withAnimation{
                                selectedCategory = category.categoryName
                            }
                        }, label: {
                            Text(category.categoryName)
                                .font(.callout)
                                .bold()
                                .opacity(selectedCategory == category.categoryName ? 1.0 : 0.3)
                        })
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(.fill)
                        .foregroundStyle(Color.black)
                        .cornerRadius(5)
                    }
                }
            }
            .padding(.bottom, 15)
        }
    }
}

#Preview {
    CategoryListHV()
}
