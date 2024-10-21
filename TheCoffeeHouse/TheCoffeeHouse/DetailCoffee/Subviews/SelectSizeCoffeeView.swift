//
//  SelectSizeCoffeeView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 21/10/24.
//

import SwiftUI

struct SelectSizeCoffeeView: View {
    let isDetailView: Bool
    var body: some View {
        HStack(spacing: isDetailView ? 20 : 4) {
            CoffeeSizeButton(title: "Small", isSelected: true, isDetail: isDetailView)
            CoffeeSizeButton(title: "Medium", isSelected: false, isDetail: isDetailView)
            CoffeeSizeButton(title: "Large", isSelected: false, isDetail: isDetailView)
        }
    }
}

#Preview {
    SelectSizeCoffeeView(isDetailView: true)
}
