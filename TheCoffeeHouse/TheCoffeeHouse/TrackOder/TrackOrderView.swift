//
//  TrackOrderView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import SwiftUI

struct TrackOrderView: View {
    @EnvironmentObject var listCoffeeBase: CommonCoffeeBase
    
    var body: some View {
        ZStack {
            Color(hex: "#2C2C2C")
            
            VStack(alignment: .center, spacing: 15) {
                Image("carbon_delivery")
                    .resizable()
                    .frame(width: 80, height: 80)
                Text("Thank you for your order!\n Wait for the call")
                    .font(.system(size: 24))
                    .foregroundStyle(Color(hex: "#D2AE82") ?? .blue)
                    .multilineTextAlignment(.center)
            }
            
            NavigationLink {
                OrderStatusView()
                    .toolbar(.hidden, for: .tabBar)
            } label: {
                VStack {
                    Spacer()
                    VStack {
                        Text("Track Your Order")
                            .font(.title)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .bold()
                    .font(.title3)
                    .foregroundStyle(.white)
                    .padding(16)
                    .background {
                        RoundedRectangle(cornerRadius: 32)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color(hex: "#CB8A58") ?? .black, Color(hex: "#562B1A") ?? .black]), startPoint: .leading, endPoint: .trailing))
                    }
                    .padding()
                    .padding(.vertical, 60)
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            listCoffeeBase.listCoffeeInCart.removeAll()
            listCoffeeBase.updateNumberOfCoffee()
            listCoffeeBase.updateTotalPrize()
        }
    }
}

#Preview {
    TrackOrderView()
}
