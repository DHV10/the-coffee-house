//
//  HomeView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 16/10/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State var searchText = ""
    @State var listCoffeeFiltered: [Coffee] = []
    @State var listCoffeeFiltered2: [Coffee] = []
    @State var finalCoffeeFilter: [Coffee] = []
    @EnvironmentObject var listCoffeeBase: CommonCoffeeBase
    
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
                
                SearchView(searchText: $searchText)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .onChange(of: searchText) { newValue in
                        if listCoffeeBase.listCategoriesSelected.isEmpty {
                            if !newValue.isEmpty {
                                listCoffeeFiltered = menuItems.filter { $0.title.lowercased().contains(newValue.lowercased()) }
                            } else {
                                listCoffeeFiltered = menuItems
                            }
                        } else {
                            if !newValue.isEmpty {
                                listCoffeeFiltered = listCoffeeFiltered2.filter { $0.title.lowercased().contains(newValue.lowercased()) }
                            } else {
                                listCoffeeFiltered = listCoffeeFiltered2
                            }
                        }
                        finalCoffeeFilter = listCoffeeFiltered
                    }
                
                CategoriesView()
                    .scaledToFit()
                    .padding(.horizontal, 16)
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                        ForEach((searchText.isEmpty && listCoffeeBase.listCategoriesSelected.isEmpty) ? menuItems : finalCoffeeFilter, id: \.id) { coffee in
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
            .onAppear {
                listCoffeeFiltered = menuItems
                listCoffeeFiltered2 = listCoffeeFiltered
            }
            .onChange(of: listCoffeeBase.listCategoriesSelected) { newValue in
                listCoffeeFiltered2 = []
                if !newValue.isEmpty {
                    newValue.forEach { cat in
                        listCoffeeFiltered2.append(contentsOf: menuItems.filter({ ($0.category == cat) }))
                    }
                } else {
                    listCoffeeFiltered2 = menuItems
                }
                if searchText.isEmpty {
                    finalCoffeeFilter = listCoffeeFiltered2
                } else {
                    finalCoffeeFilter = listCoffeeFiltered2.filter({ $0.title.contains(searchText) })
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
