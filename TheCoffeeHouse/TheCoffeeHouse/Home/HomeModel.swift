//
//  HomeModel.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 16/10/24.
//

import Foundation

struct Coffee: Codable, Identifiable {
    var id: String
    let image: String
    let title: String
    let about: String
    let prize: String
    let rate: String
    let size: [String]
    let category: String
    var isFavourite: Bool
    var quantity: Int = 1
}
