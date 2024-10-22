//
//  HomeModel.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 16/10/24.
//

import Foundation

struct Category {
    let icon: String
    let name: String
}

struct Coffee: Codable, Identifiable {
    let id: String
    let image: String
    let title: String
    let about: String
    let prize: String
    let rate: String
    let size: [String]
    let isFavourite: Bool
}

struct Topping: Codable {
    let type: String
    let quatity: Int
}
