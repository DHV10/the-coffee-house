//
//  AddToppingView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 21/10/24.
//

import SwiftUI

struct Toppings {
    var name: String
    var total: Int
}

struct AddToppingView: View {
    let aTopping: Toppings
    
    var body: some View {
        VStack {
            HStack {
                Text("\(aTopping.name)")
                Spacer()
                Button {
                    
                } label: {
                    Image("less_o")
                }
                
                Text("\(aTopping.total)")
                Button {
                    
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

#Preview {
    AddToppingView(aTopping: Toppings(name: "carmel", total: 3))
}
