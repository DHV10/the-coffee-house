//
//  CartViewModel.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import Foundation
import SwiftUI

class CartViewModel: ObservableObject {
    
    @Published var listCartCoffee: [Coffee] = []
    
    init() {
//        getListCart()
    }
    
    func getListCart() {
//        listCartCoffee = mockData
    }
}
