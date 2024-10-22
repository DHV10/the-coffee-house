//
//  OrderView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import SwiftUI

struct OrderView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listCoffeeBase: ListCoffeeBase
    @ObservedObject var viewModel = OrderViewModel()
    
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
            
            VStack {
                ForEach(listCoffeeBase.listCoffeeInCart) { order in
                    CoffeeListView(isFavScreen: false, coffeeItem: order)
                }
            }
            
            HStack {
                Image(systemName: "mappin.circle")
                Text("Your location here")
                
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
                Text("Total: 16$")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.headline)
                
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
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OrderView()
}
