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
    @State private var hasFetchedData = false
    
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
                                listCoffeeFiltered = listCoffeeBase.lisCoffeeHome.filter { $0.title.lowercased().contains(newValue.lowercased()) }
                            } else {
                                listCoffeeFiltered = listCoffeeBase.lisCoffeeHome
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
                        ForEach((searchText.isEmpty && listCoffeeBase.listCategoriesSelected.isEmpty) ? listCoffeeBase.lisCoffeeHome : finalCoffeeFilter, id: \.id) { coffee in
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
            .task {
                if !hasFetchedData {
                    await fetchCoffees()
                }
            }
            .onChange(of: listCoffeeBase.listCategoriesSelected) { newValue in
                listCoffeeFiltered2 = []
                if !newValue.isEmpty {
                    newValue.forEach { cat in
                        listCoffeeFiltered2.append(contentsOf: listCoffeeBase.lisCoffeeHome.filter({ ($0.category == cat) }))
                    }
                } else {
                    listCoffeeFiltered2 = listCoffeeBase.lisCoffeeHome
                }
                if searchText.isEmpty {
                    finalCoffeeFilter = listCoffeeFiltered2
                } else {
                    finalCoffeeFilter = listCoffeeFiltered2.filter({ $0.title.contains(searchText) })
                }
            }
        }
    }
    
    private func fetchCoffees() async {
        guard let url = URL(string: "http://127.0.0.1:8080/allCoffee") else {
            // MOCK DATA WHEN CALL API FAIL
            self.listCoffeeBase.lisCoffeeHome = menuItems
            self.listCoffeeFiltered = menuItems
            self.listCoffeeFiltered2 = listCoffeeFiltered
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let coffees = try JSONDecoder().decode([Coffee].self, from: data)
            DispatchQueue.main.async {
                self.listCoffeeBase.lisCoffeeHome = coffees
                self.listCoffeeFiltered = coffees
                self.listCoffeeFiltered2 = listCoffeeFiltered
            }
        } catch {
            // MOCK DATA WHEN CALL API FAIL
            self.listCoffeeBase.lisCoffeeHome = menuItems
            self.listCoffeeFiltered = menuItems
            self.listCoffeeFiltered2 = listCoffeeFiltered
        }
    }
}

#Preview {
    HomeView()
}
