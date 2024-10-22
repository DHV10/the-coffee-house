//
//  FavouriteView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 16/10/24.
//
import SwiftUI

struct FavouriteView: View {
    @EnvironmentObject var listCoffeeBase: ListCoffeeBase
    private var viewModel = FavouriteViewModel()
    
    var body: some View {
        VStack {
            SearchView()
                .padding(.vertical, 12)
            
            List(listCoffeeBase.listFavouriteCoffee) { coffee in
                CoffeeListView(isFavScreen: true, coffeeItem: coffee)
                    .padding(.vertical, 8)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
        }
        .padding(.horizontal, 32)
    }
}

#Preview {
    FavouriteView()
}

