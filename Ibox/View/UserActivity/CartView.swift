//
//  CartView.swift
//  Ibox
//
//  Created by Pratama One on 03/02/24.
//

import SwiftUI

struct CartView: View {
    @State private var showPaymentView = false
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .leading) {
                
                HStack(spacing: 10) {
                    Image(systemName: "checkmark.square")
                    Text("Choose all")
                        .font(.callout)
                    
                    Spacer()
                    
                    Text("Remove")
                        .font(.callout)
                }
                .padding(.vertical, 15)
                
                HStack (spacing: 13) {
                    Image(systemName: "mappin.and.ellipse")
                        .resizable()
                        .frame(width: 15, height: 18)
                        .padding(.leading, 2)
                    Text("Delivered to Kukuh Nur Pratama")
                        .font(.callout)
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: 11, height: 6)
                        .padding(.leading, -5)
                        .padding(.top, 3)
                }
                .padding(.bottom, 25)
                
                VStack(spacing: 20) {
                    VStack {
                        HStack {
                            Image("ip15promax")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 80)
                                .clipped()
                            
                            VStack(alignment: .leading) {
                                Spacer()
                                
                                Text("IPhone 15 Pro Max 256GB, Natural Titanium")
                                    .font(.caption)
                                
                                Spacer()
                                
                                HStack {
                                    Text("Price")
                                        .font(.caption)
                                    Text("$1.199")
                                        .font(.caption)
                                        .strikethrough(true, color: .red)
                                    Text("$719")
                                        .font(.caption)
                                }
                                
                                Text("Subtotal $719")
                                    .font(.caption)
                                
                                Spacer()
                            }
                            
                            Spacer()
                            
                            Text("1")
                                .font(.caption)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 12)
                                .background(.fill)
                                .cornerRadius(5)
                                .padding(.trailing, 15)
                        }
                        .border(.gray, width: 1)
                        .padding(.bottom, -3)
                        
                        HStack {
                            Image(systemName: "checkmark.square")
                                .padding(.leading, 15)
                            Text("Remove")
                                .font(.caption)
                                .padding(.horizontal, 5)
                                .padding(.vertical, 10)
                            Text("Add to wishlish")
                                .font(.caption)
                                .padding(.horizontal, 5)
                                .padding(.vertical, 10)
                            Spacer()
                        }
                        .border(.gray, width: 1)
                    }
                    
                    // 2
                    VStack {
                        HStack {
                            Image("airpodspro2")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 80)
                                .clipped()
                            
                            VStack(alignment: .leading) {
                                Spacer()
                                
                                Text("Airpods Pro Gen 2 Type-C")
                                    .font(.caption)
                                
                                Spacer()
                                
                                HStack {
                                    Text("Price")
                                        .font(.caption)
                                    Text("$719")
                                        .font(.caption)
                                }
                                
                                Text("Subtotal $719")
                                    .font(.caption)
                                
                                Spacer()
                            }
                            
                            Spacer()
                            
                            Text("1")
                                .font(.caption)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 12)
                                .background(.fill)
                                .cornerRadius(5)
                                .padding(.trailing, 15)
                        }
                        .border(.gray, width: 1)
                        .padding(.bottom, -3)
                        
                        HStack {
                            Image(systemName: "checkmark.square")
                                .padding(.leading, 15)
                            Text("Remove")
                                .font(.caption)
                                .padding(.horizontal, 5)
                                .padding(.vertical, 10)
                            Text("Add to wishlish")
                                .font(.caption)
                                .padding(.horizontal, 5)
                                .padding(.vertical, 10)
                            Spacer()
                        }
                        .border(.gray, width: 1)
                    }
                }
                
                HStack {
                    Text("Promotions can change at any time")
                        .font(.caption)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
                    
                    Spacer()
                }
                .background(.fill)
                .padding(.vertical, 20)
                
                Text("Recommended Products")
                    .font(.callout)
                    .padding(.bottom, 20)
                    .padding(.top, 10)
                
                VStack(spacing: 20) {
                    VStack {
                        HStack {
                            Image("m3spaceblack")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 80)
                                .clipped()
                            
                            VStack(alignment: .leading) {
                                Spacer()
                                
                                Text("Macbook M2 Pro 16\" 512GB Space Black")
                                    .font(.caption)
                                
                                Spacer()
                                
                                HStack {
                                    Text("Price")
                                        .font(.caption)
                                    Text("$3499")
                                        .font(.caption)
                                }
                                
                                Spacer()
                            }
                            
                            Spacer()
                            
                            Button(action: {}) {
                                Text("Add")
                                    .font(.caption)
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 12)
                                    .background(.black)
                                    .cornerRadius(5)
                                    .padding(.trailing, 15)
                                    .foregroundStyle(Color.white)
                            }
                        }
                    }
                    
                    // 2
                    VStack {
                        HStack {
                            Image("ip15promax")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 80)
                                .clipped()
                            
                            VStack(alignment: .leading) {
                                Spacer()
                                
                                Text("IPhone 14 Pro")
                                    .font(.caption)
                                
                                Spacer()
                                
                                HStack {
                                    Text("Price")
                                        .font(.caption)
                                    Text("$1.099")
                                        .font(.caption)
                                }
                                
                                Spacer()
                            }
                            
                            Spacer()
                            
                            Button(action: {}) {
                                Text("Add")
                                    .font(.caption)
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 12)
                                    .background(.black)
                                    .cornerRadius(5)
                                    .padding(.trailing, 15)
                                    .foregroundStyle(Color.white)
                            }
                        }
                    }
                    
                    // 3
                    VStack {
                        HStack {
                            Image("airpodspro2")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 80)
                                .clipped()
                            
                            VStack(alignment: .leading) {
                                Spacer()
                                
                                Text("Airpods Pro Gen 1")
                                    .font(.caption)
                                
                                Spacer()
                                
                                HStack {
                                    Text("Price")
                                        .font(.caption)
                                    Text("$499")
                                        .font(.caption)
                                }
                                
                                Spacer()
                            }
                            
                            Spacer()
                            
                            Button(action: {}) {
                                Text("Add")
                                    .font(.caption)
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 12)
                                    .background(.black)
                                    .cornerRadius(5)
                                    .padding(.trailing, 15)
                                    .foregroundStyle(Color.white)
                            }
                        }
                    }
                }
                .padding(.bottom, 20)
                
                HStack {
                    Text("Total Shopping")
                        .font(.callout)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                    
                    Spacer()
                    
                    Text("$1.438")
                        .font(.callout)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                }
                .background(.fill)
                
            }
            .padding(.bottom, 20)
            
            HStack {
                Spacer()
                
                Button(action: {
                    showPaymentView.toggle()
                }) {
                    Text("Payment")
                        .padding(.vertical, 7)
                        .foregroundStyle(Color.white)
                        .font(.callout)
                }
                .popover(isPresented: $showPaymentView, arrowEdge: .top) {
                    GeometryReader { geometry in
                        PaymentView()
                    }
                }
                
                Spacer()
            }
            .background(.black)
            .padding(.bottom, 10)
            
            Service()
        }
        .padding(.bottom, 50)
    }
}

#Preview {
    CartView()
}
