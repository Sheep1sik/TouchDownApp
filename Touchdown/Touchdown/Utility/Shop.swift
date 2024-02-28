//
//  Shop.swift
//  Touchdown
//
//  Created by 양원식 on 2024/02/28.
//

import Foundation

class Shop:ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
