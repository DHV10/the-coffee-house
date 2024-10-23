//
//  FavouriteView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 16/10/24.
//
import SwiftUI

struct FavouriteView: View {
    @EnvironmentObject var listCoffeeBase: CommonCoffeeBase
    @State var searchText = ""
    @State var listCoffeeFiltered: [Coffee] = []
    
    var body: some View {
        VStack {
            SearchView(searchText: $searchText)
                .padding(.vertical, 12)
                .onChange(of: searchText) { newValue in
                    if !newValue.isEmpty {
                        listCoffeeFiltered = listCoffeeBase.listFavouriteCoffee.filter { $0.title.lowercased().contains(newValue.lowercased()) }
                    } else {
                        listCoffeeFiltered = listCoffeeBase.listFavouriteCoffee
                    }
                }
           
            
            if !listCoffeeFiltered.isEmpty {
                List(listCoffeeFiltered) { coffee in
                    CoffeeListView(isFavScreen: true, coffeeItem: coffee)
                        .padding(.vertical, 8)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                }
                .scrollIndicators(.hidden)
                .listStyle(.plain)
            } else {
                EmptyView()
                    .padding(60)
                Spacer()
            }
        }
        .padding(.horizontal, 32)
        .onAppear {
            listCoffeeFiltered = listCoffeeBase.listFavouriteCoffee
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

#Preview {
    FavouriteView()
}

