//
//  HomeView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 16/10/24.
//

import SwiftUI

let menuItems = [
    Coffee(id: "1f23", image: "", title: "Coffee", about: "sadjasdhakjsdhajksd", rate: "3", size: [], isFavourite: true),
    Coffee(id: "12e3", image: "", title: "Coffee", about: "sadjasdhakjsdhajksd", rate: "3", size: [], isFavourite: true),
    Coffee(id: "1fd23", image: "", title: "Coffee", about: "sadjasdhakjsdhajksd", rate: "3", size: [], isFavourite: true),
    Coffee(id: "12fsfds3", image: "", title: "Coffee", about: "sadjasdhakjsdhajksd", rate: "3", size: [], isFavourite: true),
    Coffee(id: "12sdfsdf3", image: "", title: "Coffee", about: "sadjasdhakjsdhajksd", rate: "3", size: [], isFavourite: true)
]

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Address and contact info
                NavigationLink(
                    destination: Text("DHV")
                ) {
                    AddressView()
                        .background()
                        .padding(.horizontal, 10)
                }
                
                // Search Bar
//                SearchView()
//                    .padding(.horizontal, 10)
                
                // Categories
                CategoriesView()
                    .scaledToFit()
                    .padding(.horizontal, 10)
                
                // Menu Items
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 0) {
                        ForEach(menuItems, id: \.id) { item in
                            CoffeeItemView(coffeeItem: item)
                                .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    HomeView()
}
