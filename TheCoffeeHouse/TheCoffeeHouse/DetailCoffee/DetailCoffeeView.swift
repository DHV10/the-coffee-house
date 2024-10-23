//
//  DetailCoffeeView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import SwiftUI

struct DetailCoffeeView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listCoffeeBase: CommonCoffeeBase
    @State var isLiked = false
    @State var totalCaramel = 0
    @State var totalBanana = 0
    @State var totalChocolate = 0
    @State var totalStraw = 0
    let detailCoffee: Coffee
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .top) {
                ZStack(alignment: .bottom) {
                    Image(detailCoffee.image)
                        .resizable()
                        .frame(height: 280)
                    HStack {
                        Text(detailCoffee.title)
                            .bold()
                            .font(.system(size: 28))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 4)
                        Spacer()
                        HStack {
                            Image(systemName: "star.fill")
                            Text(detailCoffee.rate)
                                .padding(.trailing, 4)
                        }
                        .bold()
                        .foregroundStyle(.white)
                        .padding(4)
                        .background {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.brown)
                        }
                    }
                    .padding(8)
                    .background {
                        Rectangle()
                            .fill(Color.black.opacity(0.2))
                    }
                }
                
                HStack(alignment:.top) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image("back_white")
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        isLiked.toggle()
                        if isLiked {
                            let aCoffee = listCoffeeBase.listFavouriteCoffee.first(where: { $0.id == detailCoffee.id })
                            if aCoffee == nil {
                                listCoffeeBase.listFavouriteCoffee.append(detailCoffee)
                            }
                        } else {
                            listCoffeeBase.listFavouriteCoffee.removeAll(where: { $0.id == detailCoffee.id })
                        }
                    }, label: {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .foregroundStyle(.red)
                            .font(.title)
                    })
                }
                .font(.title2)
                .padding(.vertical, 40)
                .padding(.horizontal, 24)
            }
            VStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        Text("Size")
                            .bold()
                            .font(.system(size: 20))
                            .padding(.top, 8)
                        
                        SelectSizeCoffeeView(isDetailView: true)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("About")
                                .bold()
                                .font(.system(size: 20))
                            Text(detailCoffee.about)
                                .font(.system(size: 14))
                        }
                        .padding(.top)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Add Topping")
                                .bold()
                                .font(.system(size: 20))
                            AddToppingView(aTopping: Toppings(name: "Caramel"), totalTopping: $totalCaramel)
                            AddToppingView(aTopping: Toppings(name: "Banana "), totalTopping: $totalBanana)
                            AddToppingView(aTopping: Toppings(name: "Chocolate"), totalTopping: $totalChocolate)
                            AddToppingView(aTopping: Toppings(name: "Strawberry"), totalTopping: $totalStraw)
                        }
                        .padding(.vertical)
                    }
                    
                    Button {
                        if let index = listCoffeeBase.listCoffeeInCart.firstIndex(where: { $0.id == detailCoffee.id }) {
                            listCoffeeBase.listCoffeeInCart[index].quantity += 1
                        } else {
                            listCoffeeBase.listCoffeeInCart.append(detailCoffee)
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

                    } label: {
                        HStack {
                            Spacer()
                            Text("Add To Cart")
                            Spacer()
                            Rectangle()
                                .frame(width: 1)
                            Spacer()
                            Text("\(detailCoffee.prize)$")
                            Spacer()
                        }
                        .font(.system(size: 20))
                        .padding()
                        .foregroundStyle(.white)
                        .background {
                            RoundedRectangle(cornerRadius: 24)
                                .fill(.black)
                                .stroke(Color.gray, lineWidth: 1)
                        }
                    }
                }
                .padding(.horizontal)
                Spacer()
            }
            .background(.clear)
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden()
        .onAppear {
            isLiked = ((listCoffeeBase.listFavouriteCoffee.first(where: { $0.id == detailCoffee.id })?.isFavourite) != nil)
        }
    }
}

#Preview {
    DetailCoffeeView(detailCoffee: menuItems[0])
}
