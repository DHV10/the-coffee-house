//
//  CoffeeListView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import SwiftUI

struct CoffeeListView: View {
    @EnvironmentObject var listCoffeeBase: ListCoffeeBase
    let isFavScreen: Bool
    let coffeeItem: Coffee
    
    var body: some View {
        HStack {
            Image("mock-image")
                .resizable()
                .frame(width: 90, height: 60)
            
            VStack(alignment: .leading) {
                Text(coffeeItem.title)
                    .font(.headline)
                Text("$\(coffeeItem.rate)")
                    .font(.subheadline)
                if isFavScreen {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.red)
                }
                
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                HStack {
                    Image(systemName: "star.fill")
                    Text("4.4")
                }
                .foregroundStyle(.secondary)
                
                HStack {
                    if !isFavScreen {
                        Button {
                            
                        } label: {
                            Image("less")
                        }
                        
                        Text("9")
                    }
                    
                    Button {
                        if isFavScreen {
                            listCoffeeBase.listCoffeeInCart.append(coffeeItem)
                        } else {
                            
                        }
                    } label: {
                        Image("add-icon")
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

#Preview {
    CoffeeListView(isFavScreen: false, coffeeItem: mockData[0])
}
