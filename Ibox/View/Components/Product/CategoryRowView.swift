import SwiftUI

struct CategoryRowView: View {
    let categories: [ProductCategory]
    @Binding var selected: ProductCategoryType
    let onSelect: (ProductCategoryType) -> Void

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(categories) { cat in
                    let mapped = ProductCategoryType(fromTitle: cat.title)
                    let isActive = (mapped == selected)

                    Button {
                        if let mapped {
                            onSelect(mapped)
                            selected = mapped
                            print("Mapped: \(mapped)")
                            print("Select: \(selected)")
                        }
                    } label: {
                        VStack(spacing: 8) {
                            Image(cat.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 59, height: 59)
                                .clipped()

                            Text(cat.title)
                                .font(.system(size: 14, weight: .bold))

                            Text(cat.subtitle)
                                .font(.system(size: 11, weight: .medium))
                                .foregroundStyle(Color(.secondaryLabel))
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(isActive ? Color.black.opacity(0.06) : Color.clear)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .stroke(isActive ? Color.black.opacity(0.12) : Color.clear, lineWidth: 1)
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.vertical, 2)
        }
        .scrollIndicators(.hidden)
        .padding(.bottom, 10)
    }
}
