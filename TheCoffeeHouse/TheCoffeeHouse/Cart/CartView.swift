//
//  CartView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 16/10/24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var listCoffeeBase: ListCoffeeBase
    @ObservedObject var viewModel = CartViewModel()
    @State var total: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    NavigationLink {
                        TrackOrderView()
                            .toolbar(.hidden, for: .tabBar)
                    } label: {
                        Image("carbon_delivery")
                    }
                }
                
                Text("YOUR ORDER:")
                    .bold()
                    .font(.title3)
                ScrollView(showsIndicators: false)  {
                    VStack {
                        if viewModel.listCartCoffee.isEmpty {
                            EmptyView()
                        } else {
                            ForEach(viewModel.listCartCoffee) { coffee in
                                CoffeeListView(isFavScreen: false, coffeeItem: coffee)
                            }
                        }
                    }
                }
                if !viewModel.listCartCoffee.isEmpty {
                    Text("Total: \(viewModel.total)$")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.vertical)
                        .font(.headline)
                    
                    NavigationLink(
                        destination: OrderView()
                            .toolbar(.hidden, for: .tabBar)
                    ) {
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
                
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 16)
            .onAppear(perform: {
                viewModel.listCartCoffee = listCoffeeBase.listCoffeeInCart
                viewModel.getTotal()
            })
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CartView()
}
