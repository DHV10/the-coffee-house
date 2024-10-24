//
//  OrderView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import SwiftUI

struct OrderView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listCoffeeBase: CommonCoffeeBase
    @ObservedObject var viewModel = OrderViewModel()
    @State var total: Int = 0
    @State private var navigateToDetail = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Button {
                dismiss()
            } label: {
                Image("back")
                    .padding(.bottom, 32)
            }
            
            Text("YOUR ORDER:")
                .bold()
                .font(.title3)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    if listCoffeeBase.numberOfCoffee > 0 {
                        ForEach(listCoffeeBase.listCoffeeInCart) { order in
                            CoffeeListView(isFavScreen: false, coffeeItem: order)
                        }
                    } else {
                        HStack {
                            Spacer()
                            EmptyView()
                                .padding(30)
                            Spacer()
                        }
                    }
                }
            }
            
            HStack {
                Image(systemName: "mappin.circle")
                Text("FPT Software, Tan Xa, Thach That, Ha Noi")
            }
            .bold()
            .font(.headline)
            
            VStack(alignment: .leading) {
                Text("Payment method:")
                    .font(.headline)
                CustomDropdownWithIcons()
            }
            .padding(.top, 12)
            
            Spacer()
            
            VStack {
                Text("Total: \(listCoffeeBase.totalPrize)$")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.headline)
                if listCoffeeBase.numberOfCoffee > 0 {
                    Button {
                        navigateToDetail = true
                    } label: {
                        HStack {
                            Text("Create Order")
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
                    .navigationDestination(isPresented: $navigateToDetail) {
                        TrackOrderView()
                    }
                }
            }
        }
        .padding(.horizontal, 32)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OrderView()
}
