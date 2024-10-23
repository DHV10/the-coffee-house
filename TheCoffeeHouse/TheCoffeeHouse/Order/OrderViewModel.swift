//
//  OrderViewModel.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import Foundation

class OrderViewModel: ObservableObject {
    @Published var listOrder: [Coffee] = []
}
