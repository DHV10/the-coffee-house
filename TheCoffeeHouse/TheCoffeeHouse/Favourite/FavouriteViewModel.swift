//
//  FavouriteViewModel.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import Foundation

class FavouriteViewModel: ObservableObject {
    @Published var listFavourite: [Coffee] = []
    
    init() {
        getAllListFavourite()
    }
    
    private func getAllListFavourite() {
        listFavourite = mockData
    }
}

var mockData: [Coffee] = [
    Coffee(id: "1f23", image: "", title: "Coffee", about: "sadjasdhakjsdhajksd", prize: "5", rate: "3", size: [], isFavourite: true),
    Coffee(id: "12e3", image: "", title: "Coffee", about: "sadjasdhakjsdhajksd", prize: "6", rate: "3", size: [], isFavourite: true)
]
