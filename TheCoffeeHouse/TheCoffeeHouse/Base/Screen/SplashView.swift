//
//  SplashView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 16/10/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(hex: "#422110") ?? .black)
            Image("coffee-logo")
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
