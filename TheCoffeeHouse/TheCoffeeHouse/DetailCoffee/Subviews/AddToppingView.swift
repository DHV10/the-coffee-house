//
//  AddToppingView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 21/10/24.
//

import SwiftUI

struct Toppings {
    var name: String
}

struct AddToppingView: View {
    let aTopping: Toppings
    @Binding var totalTopping: Int
    
    var body: some View {
        VStack {
            HStack {
                Text("\(aTopping.name)")
                Spacer()
                Button {
                    if totalTopping > 0 {
                        totalTopping -= 1
                    }
                } label: {
                    Image("less_o")
                }
                
                Text("\(totalTopping)")
                Button {
                    totalTopping += 1
                } label: {
                    Image("add_o")
                }
            }
            .padding(.horizontal)
            Rectangle()
                .foregroundStyle(Color.black.opacity(0.5))
                .frame(height: 1)
        }
        
    }
}
