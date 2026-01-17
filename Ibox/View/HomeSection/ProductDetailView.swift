//
//  ProductDetailView.swift
//  Ibox
//
//  Created by Pratama One on 12/01/26.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject private var vm: ProductDetailViewModel
    @StateObject private var recommendedProduct = RecommendedViewModel()
    @StateObject private var homeViewModel = HomeViewModel()
    let onBack: () -> Void
    
    init(product: ProductDetailModels, onBack: @escaping () -> Void) {
        _vm = StateObject(wrappedValue: ProductDetailViewModel(product: product))
        self.onBack = onBack
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                HStack(spacing: 12) {
                    Spacer()
                    
                    Text("Detail Produk")
                        .font(.system(size: 15, weight: .bold))
                    
                    Spacer()
                }
                .padding(.top, 22)
                
                Text(vm.product.name)
                    .font(.system(size: 17, weight: .bold))
                
                Text("SKU: \(vm.product.sku)")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(Color(.secondaryLabel))
                
                SliderImageView(images: [
                    .init(imageName: "ip17promax"),
                    .init(imageName: "ip17promax_1"),
                    .init(imageName: "ip17promax_2"),
                    .init(imageName: "ip17promax_3"),
                ])
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(vm.product.priceText)
                        .font(.system(size: 17, weight: .bold))
                    
                    Text("atau")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(Color(.secondaryLabel))
                    
                    Text(vm.product.installmentText)
                        .font(.system(size: 15, weight: .bold))
                    
                    Button("Simulasi cicilan dan Paylater") {
                        vm.openInstallmentSimulation()
                    }
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(.blue)
                    .buttonStyle(.plain)
                }
                .padding(.top, 6)
                
                ProductBenefitRow(benefits: vm.product.benefits)
                    .padding(.top, 20)
                
                // Color
                VStack(alignment: .leading, spacing: 10) {
                    Text("Warna - \(vm.selectedColorName)")
                        .font(.system(size: 18, weight: .bold))
                    
                    ColorSwatchesView(
                        options: vm.product.colorOption,
                        selectedIndex: vm.selectedColorIndex,
                        onSelect: vm.selectColor
                    )
                }
                .padding(.top, 20)
                
                // Model
                OptionListView(
                    title: "Model",
                    options: vm.product.modelOption,
                    selectedIndex: vm.selectedModelIndex,
                    onSelect: vm.selectModel
                )
                .padding(.top, 20)
                
                // Capacity
                OptionListView(
                    title: "Kapasitas",
                    options: vm.product.capacityOptions,
                    selectedIndex: vm.selectedCapacityIndex,
                    onSelect: vm.selectCapacity
                )
                .padding(.top, 20)
                
                // Stepper Counter
                QuantityStepperView(
                    title: "Jumlah",
                    value: vm.quantity,
                    onMinus: vm.decrementQty,
                    onPlus: vm.incrementQty
                )
                .padding(.top, 20)
                
                // Info Card
                ProductInfoCardView(
                    headline: "iPhone 17 Pro",
                    subtitle: "Pro luar dalam",
                    onLearnMode: vm.openLearnMore,
                    onCompare: vm.openCompareModels
                )
                .padding(.top, 20)
                
                // Decription
                ProductDescriptionSection(
                    description: "iPhone 17 Pro Max. iPhone paling andal yang pernah ada. layar 6,9 inci yang cemerlang, design unibody alumunium, chip A19 Pro, semua kamera belakang 48 MP, dan kekuatan baterai terbaik",
                    features: [
                        "DESAIN UNIBODY. UNTUK KEANDALAN MENGAGUMKAN. Desain unibody aluminium, ditempa dalam suhu tinggi, untuk iPhone paling andal yang pernah dibuat.",
                        "CERAMIC SHIELD TANGGUH. DEPAN DAN BELAKANG. Ceramic Shield melindungi bagian belakang iPhone 17 Pro Max, membuatnya 4x lipat lebih tahan retak. Dan Ceramic Shield 2 baru di bagian depan 3x lipat lebih tahan gores.",
                        "SISTEM KAMERA PRO PALING MAKSIMALD dengan semua kamera belakang 48 MP dan 8x zoom kualitas optik rentang zoom terluas yang pernah ada di iPhone. Seperti membawa 8 lensa pro di saku Anda.",
                        "KAMERA DEPAN 18MP CENTER STAGE berbagai cara fleksibel untuk mengatur framing. Selfie grup lebih pintar, video Dual Capture untuk perekaman depan dan belakang secara bersamaan, dan banyak lagi.",
                        "CHIP A19 PRO. PENDINGINAN UAP. SECEPAT KILAT. A19 Pro adalah chip iPhone paling andal yang pernah ada, menghadirkan performa berkelanjutan hingga 40 persen lebih baik.",
                        "KEKUATAN BATERAI TERBAIK YANG PERNAH ADA DI IPHONE. Desain unibody menghasilkan tambahan kapasitas baterai yang besar, untuk pemutaran video hingga 39 jam. Isi daya hingga 50% dalam 20 menit.",
                        "iOS 26. TAMPILAN BARU. LEBIH BANYAK KEAJAIBAN. Desain baru dengan Liquid Glass. Indah, menyenangkan, dan tetap familier. Dengan Layar Terkunci yang lebih terang, voting dan latar belakang di Pesan yang dapat disesuaikan, Penyaringan Panggilan, dan banyak lagi.",
                        "FITUR KESELAMATAN PENTING. Dengan Deteksi Tabrakan, iPhone bisa mendeteksi tabrakan mobil yang parah dan memanggil bantuan saat Anda tak bisa.",
                        "KONEKTIVITAS MAKIN KUAT. KECEPATAN MAKIN UNGGUL. Tetap terhubung lebih cepat dengan koneksi aman ke Wi-Fi 7, jaringan 5G, dan Bluetooth 6, plus eSIM."
                    ],
                    package: [
                        "iPhone dengan iOS 26",
                        "Kabel dari USB-C ke USB-C",
                        "Buku manual dan dokemuntasi lain"
                    ],
                    warranty: [
                        "Garansi pabrik - Jasa Servis",
                        "Garansi Pabrik - Suku Cadang",
                        "Garansi Terbatas Apple Satu (1) Tahun"
                    ]
                )
                .padding(.top, 20)
                
                RecommendedSectionWitTitleView(items: recommendedProduct.recommended) { item in
                    recommendedProduct.buyNow(item)
                }
                .padding(.top, 20)
                
                FeatureGridView(items: homeViewModel.features)
                .padding(.top, 20)
                
                Spacer(minLength: 16)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 10)
        }
        .scrollIndicators(.hidden)
        .safeAreaInset(edge: .bottom) {
            StickyAddToCartBar(
                priceText: "Rp25.749.000",
                installmentText: "Rp1.072.875/bln. untuk 24 bln.*",
                onAddToCart: {}
            )
        }
        .onAppear {
            recommendedProduct.loadRecommeded()
            homeViewModel.load()
        }
    }
}
