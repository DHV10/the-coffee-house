//
//  Constants.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 16/10/24.
//

import Foundation

class CommonCoffeeBase: ObservableObject {
    @Published var lisCoffeeHome: [Coffee] = []
    @Published var listCoffeeInCart: [Coffee] = []
    @Published var listFavouriteCoffee: [Coffee] = []
    @Published var numberOfCoffee: Int = 0
    @Published var totalPrize: Int = 0
    @Published var isAdded: Bool = false
    @Published var isSplashActive: Bool = true
    @Published var isLoggedIn: Bool = false
    @Published var listCategoriesSelected: [String] = []
    
    func updateTotalPrize() {
        var total: Int = 0
        listCoffeeInCart.forEach { coffee in
            total += (Int(coffee.prize) ?? 0) * coffee.quantity
        }
        totalPrize = total
    }
    
    func updateNumberOfCoffee() {
        var total = 0
        listCoffeeInCart.forEach({ coffee in
            total += coffee.quantity
        })
        numberOfCoffee = total
    }
}
