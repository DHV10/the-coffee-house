//
//  CoffeeListView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import SwiftUI

struct CoffeeListView: View {
    @EnvironmentObject var listCoffeeBase: CommonCoffeeBase
    let isFavScreen: Bool
    let coffeeItem: Coffee

    var body: some View {
        HStack(alignment: .top) {
            Image(coffeeItem.image)
                .resizable()
                .frame(width: 90, height: 60)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(coffeeItem.title)
                    .font(.headline)
                Text("\(coffeeItem.prize)$")
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
                    Text(coffeeItem.rate)
                }
                .foregroundStyle(.secondary)

                HStack {
                    if !isFavScreen {
                        Button {
                            if let index = listCoffeeBase.listCoffeeInCart.firstIndex(where: { $0.id == coffeeItem.id }) {
                                let quantity = listCoffeeBase.listCoffeeInCart[index].quantity
                                if quantity > 1 {
                                    listCoffeeBase.listCoffeeInCart[index].quantity -= 1
                                } else {
                                    listCoffeeBase.listCoffeeInCart.removeAll(where: { $0.id == coffeeItem.id })
                                }
                            }
                            listCoffeeBase.updateTotalPrize()
                            listCoffeeBase.updateNumberOfCoffee()
                        } label: {
                            Image("less")
                        }

                        Text("\(coffeeItem.quantity)")
                            .font(.subheadline)
                    }

                    Button {
                        if let index = listCoffeeBase.listCoffeeInCart.firstIndex(where: { $0.id == coffeeItem.id }) {
                            listCoffeeBase.listCoffeeInCart[index].quantity += 1
                        } else {
                            listCoffeeBase.listCoffeeInCart.append(coffeeItem)
                        }
                        if isFavScreen {
                            withAnimation(.easeInOut) {
                                listCoffeeBase.isAdded = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                withAnimation(.easeInOut) {
                                    listCoffeeBase.isAdded = false
                                }
                            }
                        }
                        listCoffeeBase.updateTotalPrize()
                        listCoffeeBase.updateNumberOfCoffee()
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
    CoffeeListView(isFavScreen: false, coffeeItem: menuItems[0])
}
