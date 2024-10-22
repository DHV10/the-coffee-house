//
//  TheCoffeeHouseApp.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 14/10/24.
//

import SwiftUI

@main
struct TheCoffeeHouseApp: App {
    @StateObject var listCofeeBase = ListCoffeeBase()
    var body: some Scene {
        WindowGroup {
            TabbarView()
                .environmentObject(listCofeeBase)
        }
    }
}
