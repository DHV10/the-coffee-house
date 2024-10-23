//
//  BaseView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 23/10/24.
//

import SwiftUI

struct BaseView: View {
    @EnvironmentObject var listCoffeeBase: CommonCoffeeBase
    
    var body: some View {
        ZStack {
            if listCoffeeBase.isSplashActive {
                SplashView()
            } else {
                NavigationStack {
                    LoginView()
                }
                .navigationBarBackButtonHidden()
            }
            
            if listCoffeeBase.isAdded {
                CheckedView()
                    .transition(.move(edge: .top))
                    .animation(.easeInOut(duration: 0.5))
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeInOut) {
                    listCoffeeBase.isSplashActive = false
                }
            }
        }
    }
}

#Preview {
    BaseView()
}
