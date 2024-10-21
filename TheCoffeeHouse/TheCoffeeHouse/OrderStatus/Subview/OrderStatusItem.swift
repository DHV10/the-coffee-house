//
//  OrderStatusItem.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 21/10/24.
//

import SwiftUI

struct OrderStatusItem: View {
    var icon: String
    var status: String
    var date: String
    var time: String
    var isCompleted: Bool
    var isLastItem: Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            // Icon
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundStyle((isCompleted ? Color(hex: "#CB8A58") ?? .blue : Color.black))
                
                // Vertical line
                
                VStack(spacing: 0) {
                    Circle()
                        .fill(.clear)
                        .stroke((isCompleted ? Color(hex: "#CB8A58") ?? .blue : Color.gray), lineWidth: 3)
                        .frame(width: 20, height: 20)
                    
                    if !isLastItem {
                        Rectangle()
                            .frame(width: 3, height: 60)
                            .foregroundColor(isCompleted ? Color(hex: "#CB8A58") ?? .blue : .gray)
                    }
                }
            }
            
            // Status information
            VStack(alignment: .leading) {
                Text(status)
                    .font(.headline)
                
                HStack {
                    Text(date)
                        .font(.caption)
                    Spacer()
                    Text(time)
                        .font(.caption)
                }
            }
            .frame(height: 60)
            .padding(.horizontal, 10)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isCompleted ? Color(hex: "#CB8A58") ?? .blue : Color.gray.opacity(0.5), lineWidth: 1)
                    .background(Color.gray.opacity(0.1))
            )
            Spacer()
        }
    }
}

#Preview {
    OrderStatusItem(icon: "confirmed", status: "Done", date: "20-11-2024", time: "18:00", isCompleted: true, isLastItem: false)
}
