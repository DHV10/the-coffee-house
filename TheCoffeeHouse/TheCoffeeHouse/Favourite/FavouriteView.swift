//
//  FavouriteView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 16/10/24.
//
import SwiftUI

struct CoffeeDetailView: View {
    @State private var selectedSize: String = "Small"
    @State private var toppings = [
        "Caramel": 0,
        "Banana": 0,
        "Chocolate": 0,
        "Strawberry": 0
    ]
    
    var body: some View {
        VStack {
            // Image and header
            ZStack(alignment: .bottomLeading) {
                Image("cappuccino") // Replace with your image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .clipped()
                
                VStack(alignment: .leading) {
                    Text("Cappuccino")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("4.9")
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }
            
            // Coffee size selection
            VStack(alignment: .leading) {
                Text("Coffee Size")
                    .font(.headline)
                    .padding(.top)
                
                HStack {
                    ForEach(["Small", "Medium", "Large"], id: \.self) { size in
                        Button(action: {
                            selectedSize = size
                        }) {
                            Text(size)
                                .padding()
                                .background(selectedSize == size ? Color.brown : Color.gray.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }
                }
                .padding(.vertical)
            }
            .padding(.horizontal)
            
            // About section
            VStack(alignment: .leading, spacing: 10) {
                Text("About")
                    .font(.headline)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porttitor mollis velit.")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            
            // Toppings section
            VStack(alignment: .leading, spacing: 10) {
                Text("Add Topping (1$)")
                    .font(.headline)
                
                ForEach(toppings.keys.sorted(), id: \.self) { topping in
                    HStack {
                        Text(topping)
                        Spacer()
                        HStack {
                            Button(action: {
                                if toppings[topping]! > 0 {
                                    toppings[topping]! -= 1
                                }
                            }) {
                                Image(systemName: "minus.circle")
                            }
                            Text("\(toppings[topping]!)")
                            Button(action: {
                                toppings[topping]! += 1
                            }) {
                                Image(systemName: "plus.circle")
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Add to Cart button
            HStack {
                Button(action: {
                    // Add to cart logic
                }) {
                    Text("Add to Cart")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
                
                Spacer()
                
                Text("4$")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}

struct CoffeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeDetailView()
    }
}
