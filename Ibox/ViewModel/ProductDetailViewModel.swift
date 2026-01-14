//
//  ProductDetailViewModel.swift
//  Ibox
//
//  Created by Pratama One on 12/01/26.
//

import SwiftUI

@MainActor
final class ProductDetailViewModel: ObservableObject {
    @Published private(set) var product: ProductDetailModels
    
    @Published var selectedColorIndex: Int = 0
    @Published var selectedModelIndex: Int = 0
    @Published var selectedCapacityIndex: Int = 0
    
    @Published var selectedVariantIndex: Int = 0
    @Published var imageIndex: Int = 0
    
    init(product: ProductDetailModels) {
        self.product = product
    }
    
    var selectedVariant: ProductVariant {
        product.variants[max(0, min(selectedVariantIndex, product.variants.count - 1))]
    }
    
    var currentImageName: String? {
        let images = selectedVariant.imageNames
        guard !images.isEmpty else { return nil }
        return images[max(0, min(imageIndex, images.count - 1))]
    }
    
    var selectedColorLabel: String {
        selectedVariant.colorName
    }
    
    func prevImage() {
        let images = selectedVariant.imageNames
        guard !images.isEmpty else { return }
        imageIndex = max(imageIndex - 1, 0)
    }
    
    func nextImage() {
        let images = selectedVariant.imageNames
        guard !images.isEmpty else { return }
        imageIndex = min(imageIndex + 1, images.count - 1)
    }
    
    func selectVariant(at idx: Int) {
        guard product.variants.indices.contains(idx) else { return }
        selectedVariantIndex = idx
        imageIndex = 0
    }
    
    func openInstallmentSimulation() {
        // TODO : Open sheet / navigate
        print("Open installment simulation")
    }
    
    var selectedColorName: String {
        product.colorOption.indices.contains(selectedColorIndex)
        ? product.colorOption[selectedColorIndex].name
        : "-"
    }
    
    func selectColor(_ idx: Int) {
        guard product.colorOption.indices.contains(idx) else { return }
        selectedColorIndex = idx
    }
    
    func selectModel(_ idx: Int) {
        guard product.modelOption.indices.contains(idx) else { return }
        selectedModelIndex = idx
    }
    
    func selectCapacity(_ idx: Int) {
        guard product.capacityOptions.indices.contains(idx) else { return }
        selectedCapacityIndex = idx
    }
    
    func addToCart() {
        let color = selectedColorName
        let model = product.modelOption[selectedModelIndex].title
        let cap = product.capacityOptions[selectedCapacityIndex].title
        // Just Debug
        // TODO : Cart Service from API
        // print("Add to cart via vapor")
        print("Add to cart:", product.name, color, model, cap)
    }
}
