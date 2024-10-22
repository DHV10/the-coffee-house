//
//  FavouriteViewModel.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import Foundation

class FavouriteViewModel: ObservableObject {
    @Published var listFavourite: [Coffee] = []
}
