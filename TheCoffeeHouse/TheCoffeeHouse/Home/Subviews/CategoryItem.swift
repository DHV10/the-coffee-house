//
//  CategoryItem.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 17/10/24.
//

import SwiftUI

struct CategoryItem: View {
    let title: String
    let icon: String
    var action: () -> Void
    @State var isSelected: Bool = false

    var body: some View {
        Button(action: {
            action()
            isSelected.toggle()
        }) {
            HStack {
                Image(icon)
                    .resizable()
                    .frame(width: 16, height: 16)
                Text(title)
                    .font(.system(size: 12, weight: .medium))
                    .fixedSize()
                    .foregroundStyle(isSelected ? .white : .black)
            }
            .padding(10)
            .background(
                Group {
                    if isSelected {
                        LinearGradient(gradient: Gradient(colors: [Color(hex: "#CB8A58") ?? .black, Color(hex: "#562B1A") ?? .black]), startPoint: .leading, endPoint: .trailing)
                    } else {
                        Color.white
                    }
                }
            )
            .cornerRadius(36)
            .overlay(
                RoundedRectangle(cornerRadius: 36)
                    .stroke(Color.black, lineWidth: 1)
            )
            .frame(minWidth: 0)
            
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct CoffeeSizeButton: View {
    var title: String
    var isSelected: Bool
    var isDetail: Bool = true

    var body: some View {
        Text(title)
            .font(.system(size: isDetail ? 16 : 6, weight: .medium))
            .padding(isDetail ? 10 : 4)
            .background(isSelected ? Color.brown : Color.clear)
            .foregroundColor(isSelected ? .white : .brown)
            .cornerRadius(24)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color.brown, lineWidth: 1)
            )
    }
}

#Preview {
    CoffeeSizeButton(title: "Small", isSelected: true)
}
