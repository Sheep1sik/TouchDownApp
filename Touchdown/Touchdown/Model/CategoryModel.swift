//
//  CategoryModel.swift
//  Touchdown
//
//  Created by 양원식 on 2024/02/27.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
