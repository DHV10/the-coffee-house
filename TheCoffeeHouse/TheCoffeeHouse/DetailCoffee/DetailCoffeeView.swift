//
//  DetailCoffeeView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import SwiftUI

struct DetailCoffeeView: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .top) {
                ZStack(alignment: .bottom) {
                    Image("coffee-detail")
                        .resizable()
                        .frame(height: 280)
                    HStack {
                        Text("Capuchino")
                            .bold()
                            .font(.system(size: 28))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 4)
                        Spacer()
                        HStack {
                            Image(systemName: "star.fill")
                            Text("4.9")
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
                        
                    }, label: {
                        Image("back_white")
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "heart")
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
                        Text("Coffee Size")
                            .bold()
                            .font(.system(size: 20))
                            .padding(.top, 8)
                        
                        SelectSizeCoffeeView(isDetailView: true)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("About")
                                .bold()
                                .font(.system(size: 20))
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit. ")
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
                        
                    } label: {
                        HStack {
                            Spacer()
                            Text("Add To Cart")
                            Spacer()
                            Rectangle()
                                .frame(width: 1)
                            Spacer()
                            Text("4$")
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
    }
}

#Preview {
    DetailCoffeeView()
}
