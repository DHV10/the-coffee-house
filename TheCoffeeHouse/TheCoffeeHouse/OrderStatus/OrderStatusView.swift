//
//  OrderStatusView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 21/10/24.
//

import SwiftUI

struct OrderStatusView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 80) {
            // Header with back button and title
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image("back")
                }
                
                Spacer()
                Text("Order Status Details")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            }
            .padding()
            
            VStack(spacing: 0) {
                OrderStatusItem(icon: "shippingbox.fill", status: "Order Confirmed", date: "20-12-2022", time: "11:00PM", isCompleted: true, isLastItem: false)
                
                OrderStatusItem(icon: "archivebox.circle", status: "Order Processed", date: "20-12-2022", time: "10:00PM", isCompleted: false, isLastItem: false)
                
                OrderStatusItem(icon: "truck.box.fill", status: "On Delivery", date: "20-12-2022", time: "12:00PM", isCompleted: false, isLastItem: false)
                
                OrderStatusItem(icon: "hand.thumbsup.fill", status: "Order Completed", date: "20-12-2022", time: "......", isCompleted: false, isLastItem: true)
            }
            .padding()
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    OrderStatusView()
}
