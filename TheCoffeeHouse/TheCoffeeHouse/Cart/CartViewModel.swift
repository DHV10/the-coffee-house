//
//  CartViewModel.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var listCartCoffee: [Coffee] = []
}
