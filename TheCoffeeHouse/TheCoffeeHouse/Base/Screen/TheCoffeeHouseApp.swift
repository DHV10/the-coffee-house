//
//  TheCoffeeHouseApp.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 14/10/24.
//

import SwiftUI

@main
struct TheCoffeeHouseApp: App {
    @StateObject var listCofeeBase = CommonCoffeeBase()
    var body: some Scene {
        WindowGroup {
            BaseView()
                .environmentObject(listCofeeBase)
        }
    }
}
