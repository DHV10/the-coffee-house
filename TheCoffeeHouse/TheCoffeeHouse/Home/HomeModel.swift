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

struct Coffee: Codable {
    let id: String
    let image: String
    let title: String
    let about: String
    let rate: String
    let size: [String]
//    let toppings: [Topping]?
    let isFavourite: Bool
}

struct Topping: Codable {
    let type: String
    let quatity: Int
}
