//
//  ContentView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 14/10/24.
//

import SwiftUI

struct TabbarView: View {
    @EnvironmentObject var listCoffeeBase: ListCoffeeBase
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .foregroundStyle(.brown)
                }
            
            FavouriteView()
                .tabItem {
                    VStack {
                        Image(systemName: "heart.fill")
                        Text("Favourite")
                    }
                }
            
            CartView()
                .tabItem {
                    VStack {
                        Image(systemName: "cart.fill")
                        Text("CartView")
                    }
                }
                .badge("\(listCoffeeBase.listCoffeeInCart.count)")
            
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName:"person.circle")
                        Text("Profile")
                    }
                }
        }
        .tint(.brown)
        .onAppear(perform: {
            UITabBar.appearance().backgroundColor = UIColor(Color(hex: "#F8F7FA") ?? .gray)
        })
    }
}

#Preview {
    TabbarView()
}
