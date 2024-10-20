//
//  CartView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 16/10/24.
//

import SwiftUI

struct CartView: View {
    private var viewModel = CartViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image("carbon_delivery")
            }
            
            Text("YOUR ORDER:")
                .bold()
                .font(.title3)
            
            VStack {
                ForEach(viewModel.listCartCoffee) { coffee in
                    CoffeeListView(isFavScreen: false)
                }
                
                Text("Total: 14$")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.vertical)
                    .font(.headline)
                
                Spacer()
                
                HStack {
                    Text("Go to Cart")
                        .foregroundStyle(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .bold()
                .font(.title3)
                .foregroundStyle(.white)
                .padding(16)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.black)
                        .stroke(Color.gray, lineWidth: 1)
                }
            }
        }
        .padding(.horizontal, 32)
        .padding(.bottom, 16)
    }
}

#Preview {
    CartView()
}
