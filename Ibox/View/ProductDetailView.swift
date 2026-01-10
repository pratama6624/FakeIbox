//
//  ProductDetail.swift
//  Ibox
//
//  Created by Pratama One on 03/02/24.
//

import SwiftUI
import WebKit

struct ProductDetailView: View {
    @State var photos = ["ip154", "ip152", "ip153", "ip155", "ip157"]
    @State private var information: String = "Get the latest information"
    @State private var selectedColor: String?
    @State private var selectedStorage: Int?
    @State private var frameHeight: CGFloat = 400
    @State private var isShadwo: Bool = true

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    VStack(alignment: .center) {
                        HStack {
                            Image(systemName: "info.circle")
                            
                            Text("Product Detail")
                                .font(.headline)
                                .padding(.leading, -3)
                        }
                        .padding(.top, 15)
                        .padding(.bottom, -20)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack (spacing: 10) {
                                ForEach(photos, id: \.self) { photo in
                                    Image(photo)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 60)
                                        .cornerRadius(5)
                                        .shadow(color: Color.gray.opacity(0.9), radius: 1, x: 0, y: 0)
                                }
                            }
                            .padding(.all, 5)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("IPhone 15 Pro Max")
                            .font(.title2)
                            .bold()
                        
                        Button(action: {}) {
                            Text("CLICK & PICKUP")
                                .font(.caption)
                                .padding(.all, 5)
                                .foregroundStyle(Color.white)
                                .background(.blue)
                                .cornerRadius(5)
                        }
                        
                        HStack {
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(Color.green)
                            Text("Stock")
                                .font(.caption)
                            
                            Spacer()
                            
                            Image(systemName: "car.circle")
                            Text("Free shipping")
                                .font(.caption)
                            
                            Spacer()
                            
                            Image(systemName: "0.circle")
                            Text("Instalment 0%")
                                .font(.caption)
                        }
                        .padding(.vertical, 10)
                        
                        Text("Colors :")
                            .font(.caption)
                            .bold()
                        
                        HStack {
                            Button(action: {
                                selectedColor = "Natural Titanium"
                            }) {
                                Text("Natural Titanium")
                                    .font(.caption)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 12)
                                    .border(Color.gray, width: 0.7)
                                    .foregroundStyle(Color.black)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(selectedColor == "Natural Titanium" ? .blue : .clear)
                                    .opacity(0.4)
                            )
                            
                            Button(action: {
                                selectedColor = "Blue Titanium"
                            }) {
                                Text("Blue Titanium")
                                    .font(.caption)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 12)
                                    .border(Color.gray, width: 0.7)
                                    .foregroundStyle(Color.black)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(selectedColor == "Blue Titanium" ? .blue : .clear)
                                    .opacity(0.4)
                            )
                        }
                        
                        HStack {
                            Button(action: {
                                selectedColor = "White Titanium"
                            }) {
                                Text("White Titanium")
                                    .font(.caption)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 12)
                                    .border(Color.gray, width: 0.7)
                                    .foregroundStyle(Color.black)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(selectedColor == "White Titanium" ? .blue : .clear)
                                    .opacity(0.4)
                            )
                            
                            Button(action: {
                                selectedColor = "Black Titanium"
                            }) {
                                Text("Black Titanium")
                                    .font(.caption)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 12)
                                    .border(Color.gray, width: 0.7)
                                    .foregroundStyle(Color.black)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(selectedColor == "Black Titanium" ? .blue : .clear)
                                    .opacity(0.4)
                            )
                        }
                        .padding(.bottom, 10)
                        
                        Text("Capacity :")
                            .font(.caption)
                            .bold()
                        
                        HStack {
                            Button(action: {
                                selectedStorage = 256
                            }) {
                                Text("256 GB")
                                    .font(.caption)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 12)
                                    .border(Color.gray, width: 0.7)
                                    .foregroundStyle(Color.black)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(selectedStorage == 256 ? .blue : .clear)
                                    .opacity(0.4)
                            )
                            
                            Button(action: {
                                selectedStorage = 512
                            }) {
                                Text("512 GB")
                                    .font(.caption)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 12)
                                    .border(Color.gray, width: 0.7)
                                    .foregroundStyle(Color.black)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(selectedStorage == 512 ? .blue : .clear)
                                    .opacity(0.4)
                            )
                            
                            Button(action: {
                                selectedStorage = 1
                            }) {
                                Text("1 TB")
                                    .font(.caption)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 12)
                                    .border(Color.gray, width: 0.7)
                                    .foregroundStyle(Color.black)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(selectedStorage == 1 ? .blue : .clear)
                                    .opacity(0.4)
                            )
                        }
                        .padding(.bottom, 10)
                        
                        Text("iPhone 15 Pro Max. Lahir dari titanium dan dilengkapi chip A17 Pro terobosan, tombol Tindakan yang dapat disesuaikan, dan sistem kamera iPhone paling andal yang pernah ada.")
                            .font(.caption)
                        
                        VStack(alignment: .leading) {
                            Text("Fill in the Box :")
                                .font(.caption)
                                .bold()
                            // Loop VStack
                            Text("- IPhone 15 Pro Max")
                                .font(.caption)
                                .bold()
                            Text("- USB Cable from C to C")
                                .font(.caption)
                                .bold()
                            Text("- Manuals & Other Documentation")
                                .font(.caption)
                                .bold()
                        }
                        .padding(.top, 20)
                    }
                    .padding(.top, 15)
                    .padding(.horizontal, 5)
                    
                    VStack(alignment: .leading) {
                        Text("Description :")
                            .font(.caption)
                            .bold()
                        WebView(videoUrl: "https://www.youtube.com/watch?v=xqyUdNxWazA&t=33s")
                                        .frame(height: 170)
                                        .padding(.leading, -5)
                        
                        Text("Key feature points")
                            .font(.caption)
                            .bold()
                            .padding(.bottom, 5)
                        
                        Text("BORN FROM TITANIUM — iPhone 15 Pro Max features a strong, lightweight aerospace-grade titanium design with a textured matte glass back. It is also equipped with a Ceramic Shield front which is tougher than any smartphone glass. And is splash, water, and dust resistant.(1)")
                            .font(.caption)
                            .padding(.vertical, 5)
                        
                        Text("ADVANCED DISPLAY — The 6.7″(2) Super Retina XDR display with ProMotion increases the refresh rate to 120 Hz when you need extraordinary graphics performance. Dynamic Island displays notification bubbles and Live Activity. Plus, with an Always-On display, the Lock Screen is always visible at a glance, so you don't have to tap it for information.")
                            .font(.caption)
                            .padding(.vertical, 5)
                        
                        Text("THE A17 PRO CHIP THAT CHANGES EVERYTHING — The Pro-class GPU makes mobile gaming truly immersive, with diverse environments and lifelike characters. The A17 Pro is also very efficient and helps deliver impressive all-day battery life.(3)")
                            .font(.caption)
                            .padding(.vertical, 5)
                        
                        Text("RELIABLE PRO CAMERA SYSTEM — Get amazing frame flexibility with seven pro lenses. Take super high resolution photos with more color and detail using the 48 MP Main camera. And take sharper close-ups from further away with the 5x Telephoto camera on iPhone 15 Pro Max.")
                            .font(.caption)
                            .padding(.vertical, 5)
                        
                        Text("CUSTOMIZABLE ACTION BUTTONS — Action buttons are shortcuts to your favorite features. Set it according to what you want, such as Silent mode, Camera, Voice Memos, or Shortcuts, and more. Then press and hold to launch the action.")
                            .font(.caption)
                            .padding(.vertical, 5)
                        
                        Text("PRO CONNECTIVITY — A new USB-C connector lets you charge your Mac or iPad with the same cable you use to charge your iPhone 15 Pro Max. With USB 3, you get a huge leap in data transfer speeds.(4) And you can download files up to 2x faster using Wi-Fi 6E.(5)")
                            .font(.caption)
                            .padding(.vertical, 5)
                        
                        Text("IMPORTANT SAFETY FEATURES — With Collision Detection, iPhone can detect serious car accidents and call for help when you can't.(6)")
                            .font(.caption)
                            .padding(.vertical, 5)
                        
                        Text("DESIGNED TO MAKE A DIFFERENCE — iPhone includes privacy protections that help you stay in control of your data. Made from more recycled materials to minimize environmental impact. And it has built-in features that make the iPhone more accessible to everyone.")
                            .font(.caption)
                            .padding(.vertical, 5)
                        
                        Text("DILENGKAPI DENGAN GARANSI APPLECARE — Setiap iPhone dilengkapi dengan garansi terbatas selama satu tahun dan dukungan teknis gratis hingga 90 hari.")
                            .font(.caption)
                            .padding(.vertical, 5)
                        
                        Text("Legal")
                            .font(.caption)
                            .bold()
                            .padding(.bottom, 5)
                        
                        Text("(1) iPhone 15, iPhone 15 Plus, iPhone 15 Pro, and iPhone 15 Pro Max are splash, water, and dust resistant and tested in controlled laboratory conditions to a level of IP68 according to IEC standard 60529 (maximum depth of 6 meters for up to 30 minutes). Splash, water and dust resistance is not permanent. Durability may decrease due to daily use. Don't try to charge a wet iPhone; see user manual for cleaning and drying instructions. Liquid damage is not covered under warranty.")
                            .font(.caption)
                            .padding(.vertical, 5)
                        
                        Text("(2) The screen has curved corners. When measured as a standard square, the screen has a diagonal size of 6.12 inches (iPhone 15 Pro, iPhone 15) or 6.69 inches (iPhone 15 Pro Max, iPhone 15 Plus). The screen area is smaller.")
                            .font(.caption)
                            .padding(.vertical, 5)
                        
                        Text("(3) Battery life varies depending on use and configuration; see apple.com/batteries for more information.")
                            .font(.caption)
                            .padding(.vertical, 5)
                        
                        Text("(4) A USB 3 cable with 10 Gbps speed is required for up to 20x faster transfers on iPhone 15 Pro models.")
                            .font(.caption)
                            .padding(.vertical, 5)
                        
                        Text("(5) Wi-Fi 6E is available in supported countries and regions.")
                            .font(.caption)
                            .padding(.vertical, 5)
                        
                        Text("(6) iPhone 15 and iPhone 15 Pro can detect serious car accidents and call for help. Requires Wi-Fi calling or cellular connection.")
                            .font(.caption)
                            .padding(.vertical, 5)
                        
                        HStack(spacing: -15) {
                            TextField("Get the latest information", text: $information)
                                .foregroundStyle(Color.gray)
                                .padding()
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            Button("Send") {
                                print("Sending: \(information)")
                            }
                            .padding(.vertical, 7)
                            .padding(.horizontal, 15)
                            .border(Color.gray, width: 0.3)
                            .background(.fill)
                            .foregroundStyle(Color.black)
                        }
                        .padding(.leading, -15)
                    }
                    .padding(.top, 20)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 150)
            
            ZStack {
                VStack(alignment: .center, spacing: 10) {
                    HStack {
                        Text("$1.199")
                            .font(.headline)
                            .foregroundStyle(.red)
                            .strikethrough(true, color: .red)
                        Text("$719")
                            .font(.headline)
                    }
                    
                    HStack(spacing: 20) {
                        Spacer()
                        Image(systemName: "minus")
                        
                        Text("1")
                            .font(.callout)
                            .padding(.horizontal, 50)
                            .padding(.vertical, 5)
                            .border(Color.gray, width: 1)
                        
                        Image(systemName: "plus")
                        Spacer()
                    }
                    
                    HStack (spacing: -10){
                        Text("Add to cart")
                            .font(.callout)
                            .foregroundStyle(.white)
                            .frame(width: UIScreen.main.bounds.width / 2.5)
                            .padding(.vertical, 8)
                            .background(.gray)
                        Text("Pick it up")
                            .font(.callout)
                            .frame(width: UIScreen.main.bounds.width / 2.5)
                            .padding(.vertical, 8)
                            .background(.fill)
                    }
                }
                .padding(.all, 20)
                
                Color.gray.opacity(0.2)
                    .frame(height: 130)
                    .padding(.horizontal, 20)
            }
            .background(.white)
        }
    }
}

struct WebView: UIViewRepresentable {
    let videoUrl: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let youtubeURL = URL(string: videoUrl) {
            let request = URLRequest(url: youtubeURL)
            uiView.load(request)
        }
    }
}

#Preview {
    ProductDetailView()
}
