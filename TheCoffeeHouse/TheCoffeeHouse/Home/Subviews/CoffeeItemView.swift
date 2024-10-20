//
//  CoffeeItemView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 17/10/24.
//

import SwiftUI

struct CoffeeItemView: View {
    let coffeeItem: Coffee
    let sizes: [String] = ["S", "M", "L"]
    let price: String = "2$"
    @State private var selectedSize: String = "M"
    @State var isLiked = false

    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topTrailing) {
                Image("coffee-detail")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: 100)
                    .cornerRadius(16)
                
                Button(action: {
                    isLiked.toggle()
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
                    Text(price)
                        .bold()
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        
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
    }
}

#Preview {
    CoffeeItemView(coffeeItem: Coffee(id: "123", image: "", title: "Coffee", about: "sadjasdhakjsdhajksd", rate: "3", size: [], isFavourite: true))
}

