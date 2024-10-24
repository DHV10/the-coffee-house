//
//  CoffeeItemView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 17/10/24.
//

import SwiftUI

struct CoffeeItemView: View {
    @EnvironmentObject var listCoffeeBase: CommonCoffeeBase
    @State var isLiked = false
    var coffeeItem: Coffee
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topTrailing) {
                Image(coffeeItem.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 150, maxHeight: 100)
                    .cornerRadius(16)
                
                Button(action: {
                    isLiked.toggle()
                    if isLiked {
                        listCoffeeBase.listFavouriteCoffee.append(coffeeItem)
                    } else {
                        listCoffeeBase.listFavouriteCoffee.removeAll(where: { $0.id == coffeeItem.id })
                    }
                }) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.red)
                        .frame(width: 16, height: 16)
                        .padding(8)
                }
            }
            .padding(8)
            
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(coffeeItem.title)
                            .bold()
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                        SelectSizeCoffeeView(isDetailView: false)
                    }
                }
                HStack {
                    Text("\(coffeeItem.prize)$")
                        .bold()
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        if let index = listCoffeeBase.listCoffeeInCart.firstIndex(where: { $0.id == coffeeItem.id }) {
                            listCoffeeBase.listCoffeeInCart[index].quantity += 1
                        } else {
                            listCoffeeBase.listCoffeeInCart.append(coffeeItem)
                        }
                        withAnimation(.easeInOut) {
                            listCoffeeBase.isAdded = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation(.easeInOut) {
                                listCoffeeBase.isAdded = false
                            }
                        }
                        listCoffeeBase.updateTotalPrize()
                        listCoffeeBase.updateNumberOfCoffee()
                    }) {
                        Image("add_brown")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color(hex: "#BFBDC0") ?? .black, lineWidth: 0.5)
        )
        .onAppear {
            isLiked = ((listCoffeeBase.listFavouriteCoffee.first(where: { $0.id == coffeeItem.id })?.isFavourite) != nil)
        }
    }
}

#Preview {
    CoffeeItemView(coffeeItem: Coffee(id: "1", image: "", title: "Coffee", about: "sadjasdhakjsdhajksd", prize: "7", rate: "3", size: [], category: "COFFEE", isFavourite: true))
}

