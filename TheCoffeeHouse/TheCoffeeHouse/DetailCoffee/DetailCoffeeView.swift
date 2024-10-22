//
//  DetailCoffeeView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import SwiftUI

struct DetailCoffeeView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listCoffeeBase: ListCoffeeBase
    @State var isLiked = false
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
                            Text("Add Topping(1$)")
                                .bold()
                                .font(.system(size: 20))
                            AddToppingView(aTopping: Toppings(name: "Caramel", total: 0))
                            AddToppingView(aTopping: Toppings(name: "Banana ", total: 0))
                            AddToppingView(aTopping: Toppings(name: "Chocolate", total: 0))
                            AddToppingView(aTopping: Toppings(name: "Strawberry", total: 0))
                        }
                        .padding(.vertical)
                    }
                    
                    Button {
                        listCoffeeBase.listCoffeeInCart.append(detailCoffee)
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
    }
}

#Preview {
    DetailCoffeeView(detailCoffee: menuItems[0])
}
