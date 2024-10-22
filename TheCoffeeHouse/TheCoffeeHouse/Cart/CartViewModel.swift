//
//  CartViewModel.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var listCartCoffee: [Coffee] = []
    @Published var total: Int = 0
    
    func getTotal() -> Int {
        listCartCoffee.forEach { coffee in
            total += Int(coffee.prize) ?? 0
        }
        return total
    }
    
    func removeCoffee(id: String) {
        guard let index = listCartCoffee.firstIndex(where: { $0.id == id }) else { return }
        listCartCoffee.remove(at: index)
    }
}
