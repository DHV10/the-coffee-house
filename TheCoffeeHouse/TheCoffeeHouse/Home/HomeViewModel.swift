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
}

let mockAbout = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit. "

var menuItems = [
    Coffee(id: "\(UUID())", image: "alcohol1", title: "Black Wine", about: mockAbout, prize: "30", rate: "5", size: [], isFavourite: false),
    Coffee(id: "\(UUID())", image: "coffee1", title: "Milk Coffee", about: mockAbout, prize: "8", rate: "3", size: [], isFavourite: false),
    Coffee(id: "\(UUID())", image: "breakfast2", title: "Waffle", about: mockAbout, prize: "4", rate: "3", size: [], isFavourite: false),
    Coffee(id: "\(UUID())", image: "coffee3", title: "Americano", about: mockAbout, prize: "15", rate: "3", size: [], isFavourite: false),
    Coffee(id: "\(UUID())", image: "coffee4", title: "Back Coffee", about: mockAbout, prize: "16", rate: "3", size: [], isFavourite: false),
    Coffee(id: "\(UUID())", image: "coffee6", title: "Nature Coffee", about: mockAbout, prize: "26", rate: "3", size: [], isFavourite: false),
    Coffee(id: "\(UUID())", image: "coffee5", title: "Coffee Salt", about: mockAbout, prize: "6", rate: "3", size: [], isFavourite: false),
    Coffee(id: "\(UUID())", image: "dessert1", title: "Chocolate", about: mockAbout, prize: "16", rate: "3", size: [], isFavourite: false),
    Coffee(id: "\(UUID())", image: "dessert2", title: "Teramisu", about: mockAbout, prize: "7", rate: "3", size: [], isFavourite: false),
    Coffee(id: "\(UUID())", image: "dessert3", title: "Red Brew", about: mockAbout, prize: "16", rate: "3", size: [], isFavourite: false),
    Coffee(id: "\(UUID())", image: "dessert4", title: "Sugar Black", about: mockAbout, prize: "30", rate: "3", size: [], isFavourite: false),
    Coffee(id: "\(UUID())", image: "coffee4", title: "Wine", about: mockAbout, prize: "16", rate: "3", size: [], isFavourite: false),
    Coffee(id: "\(UUID())", image: "coffee6", title: "Coca Cola", about: mockAbout, prize: "26", rate: "3", size: [], isFavourite: false),
    Coffee(id: "\(UUID())", image: "coffee5", title: "Coffee", about: mockAbout, prize: "6", rate: "3", size: [], isFavourite: false),
    Coffee(id: "\(UUID())", image: "dessert1", title: "Pessi", about: mockAbout, prize: "16", rate: "3", size: [], isFavourite: false),
    Coffee(id: "\(UUID())", image: "dessert2", title: "7UP", about: mockAbout, prize: "7", rate: "3", size: [], isFavourite: false),
    Coffee(id: "\(UUID())", image: "dessert3", title: "String", about: mockAbout, prize: "16", rate: "3", size: [], isFavourite: false),
    Coffee(id: "\(UUID())", image: "dessert4", title: "Lavie", about: mockAbout, prize: "30", rate: "3", size: [], isFavourite: false)
]
