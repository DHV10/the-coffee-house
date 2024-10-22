//
//  HomeModel.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 16/10/24.
//

import Foundation

struct Coffee: Codable, Identifiable {
    let id: String
    let image: String
    let title: String
    let about: String
    let prize: String
    let rate: String
    let size: [String]
    var isFavourite: Bool
}
