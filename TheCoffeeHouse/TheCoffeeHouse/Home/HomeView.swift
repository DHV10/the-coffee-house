//
//  HomeView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 16/10/24.
//

import SwiftUI

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
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
