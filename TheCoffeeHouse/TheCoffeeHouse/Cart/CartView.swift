//
//  CartView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 16/10/24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var listCoffeeBase: CommonCoffeeBase
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
                        if listCoffeeBase.listCoffeeInCart.isEmpty {
                            HStack {
                                Spacer()
                                EmptyView()
                                    .padding(60)
                                Spacer()
                            }
                        } else {
                            ForEach(listCoffeeBase.listCoffeeInCart) { coffee in
                                CoffeeListView(isFavScreen: false, coffeeItem: coffee)
                            }
                        }
                    }
                }
                if !listCoffeeBase.listCoffeeInCart.isEmpty {
                    Text("Total: \(listCoffeeBase.totalPrize)$")
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
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CartView()
}
