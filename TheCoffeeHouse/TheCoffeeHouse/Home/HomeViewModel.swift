//
//  HomeViewModel.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 22/10/24.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @EnvironmentObject var listCoffeeBase: ListCoffeeBase
    @Published var listCofeeHome: [Coffee] = []
    
    func addToCart(coffee: Coffee) {
        listCoffeeBase.listCoffeeInCart.append(coffee)
    }
}
