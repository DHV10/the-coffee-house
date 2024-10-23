//
//  SelectSizeCoffeeView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 21/10/24.
//

import SwiftUI

struct SelectSizeCoffeeView: View {
    let isDetailView: Bool
    @State var isSelectedSmall = true
    @State var isSelectedMedium = false
    @State var isSelectedLarge = false
    
    var body: some View {
        HStack(spacing: isDetailView ? 20 : 4) {
            Button {
                isSelectedSmall = true
                isSelectedMedium = false
                isSelectedLarge = false
            } label: {
                CoffeeSizeButton(title: "Small", isSelected: isSelectedSmall, isDetail: isDetailView)
            }

            Button {
                isSelectedSmall = false
                isSelectedMedium = true
                isSelectedLarge = false
            } label: {
                CoffeeSizeButton(title: "Medium", isSelected: isSelectedMedium, isDetail: isDetailView)
            }
           
            Button {
                isSelectedSmall = false
                isSelectedMedium = false
                isSelectedLarge = true
            } label: {
                CoffeeSizeButton(title: "Large", isSelected: isSelectedLarge, isDetail: isDetailView)
            }
        }
    }
}

#Preview {
    SelectSizeCoffeeView(isDetailView: true)
}
