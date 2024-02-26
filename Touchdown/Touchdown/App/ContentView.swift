//
//  ContentView.swift
//  Touchdown
//
//  Created by 양원식 on 2024/02/26.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    
    var body: some View {
        FooterView()
            .padding(.horizontal)
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
