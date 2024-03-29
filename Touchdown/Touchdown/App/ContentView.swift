//
//  ContentView.swift
//  Touchdown
//
//  Created by 양원식 on 2024/02/26.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var shop: Shop
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            if shop.showingProduct == false && shop.selectedProduct == nil {
                VStack(spacing: 0) {
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .padding(.top, UIApplication.shared.connectedScenes
                                                .compactMap { $0 as? UIWindowScene }
                                                .first?
                                                .windows
                                                .first?
                                                .safeAreaInsets
                                                .top ?? 0)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                    
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 0) {
                            FeaturedTabView()
                                .frame(width: 400, height: 235)
                                .padding(.vertical, 20)
                            
                            CategoryGridView()
                            
                            TitleView(title: "Helmets")
                            
                            LazyVGrid(columns: gridLayout, spacing: 15,content: {
                                ForEach(products) { product in
                                    ProductItemView(product: product)
                                        .onTapGesture(perform: {
                                            feedback.impactOccurred()
                                            
                                            withAnimation(.easeOut) {
                                                shop.selectedProduct = product
                                                shop.showingProduct = true
                                            }
                                        })
                                } //: LOOP
                            }) //: GRID
                            .padding(15)
                            
                            TitleView(title: "Brands")
                            
                            BrandGridView()

                            
                            FooterView()
                                .padding(.horizontal)
                            
                        } //: VSTACK
                    }) //: SCROLL
                    
                } //: VSTACK
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            } else {
                ProductDetailView()
            }
        } //: ZSTACK
        .ignoresSafeArea(.all, edges: .top)
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Shop())
    }
}
