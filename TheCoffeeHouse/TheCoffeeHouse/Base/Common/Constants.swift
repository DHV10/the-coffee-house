//
//  Constants.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 16/10/24.
//

import Foundation

enum ImageConstant: String {
    case coffeeLogo = "coffee-logo"
    case login = "login"
}

enum PaymentMethod {
    case applePay
    case visa
    case cash
}

enum StepOrder {
    case confirmed
    case processed
    case onDelivery
    case completed
}

class ListCoffeeBase: ObservableObject {
    @Published var listCoffeeInCart: [Coffee] = []
    @Published var listFavouriteCoffee: [Coffee] = []
}
