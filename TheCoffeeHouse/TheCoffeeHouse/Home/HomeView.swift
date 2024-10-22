//
//  HomeView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 16/10/24.
//

import SwiftUI

let menuItems = [
    Coffee(id: "1f23", image: "", title: "Coffee", about: "sadjasdhakjsdhajksd", prize: "3", rate: "3", size: [], isFavourite: false),
    Coffee(id: "12e3", image: "", title: "Coffee", about: "sadjasdhakjsdhajksd", prize: "3", rate: "3", size: [], isFavourite: false),
    Coffee(id: "1fd23", image: "", title: "Coffee", about: "sadjasdhakjsdhajksd", prize: "4", rate: "3", size: [], isFavourite: false),
    Coffee(id: "12fsfds3", image: "", title: "Coffee", about: "sadjasdhakjsdhajksd", prize: "5", rate: "3", size: [], isFavourite: false),
    Coffee(id: "12sdfsdf3", image: "", title: "Coffee", about: "sadjasdhakjsdhajksd", prize: "6", rate: "3", size: [], isFavourite: false)
]

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack() {
                NavigationLink(
                    destination: MapView()
                        .toolbar(.hidden, for: .tabBar)
                ) {
                    AddressView()
                        .background()
                        .padding(.horizontal, 16)
                }
                
                SearchView()
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                
                CategoriesView()
                    .scaledToFit()
                    .padding(.horizontal, 16)
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                        ForEach(menuItems, id: \.id) { coffee in
                            NavigationLink(
                                destination: DetailCoffeeView(detailCoffee: coffee)
                                    .toolbar(.hidden, for: .tabBar)
                            ) {
                                CoffeeItemView(coffeeItem: coffee)
                            }  
                        }
                    }
                    .padding(.horizontal, 32)
                }
            }
            .padding(.bottom, 16)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
