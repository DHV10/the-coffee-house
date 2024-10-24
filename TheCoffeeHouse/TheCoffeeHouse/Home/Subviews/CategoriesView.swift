//
//  CategoriesView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 17/10/24.
//

import SwiftUI

struct CategoriesView: View {
    @EnvironmentObject var listCoffeeBase: CommonCoffeeBase
    var categories = [
        ("COFFEE", "coffee-cat"),
        ("DESSERTS", "pancake"),
        ("ALCOHOL", "wine"),
        ("ALCOHOL FREE", "wine.free"),
        ("BREAKFAST", "breakfast")
    ]

    var body: some View {
        VStack(spacing: 30) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Categories")
                    .font(.headline)
                    .padding(.horizontal)
                
                ScrollView {
                    GeometryReader { geometry in
                        self.generateContent(in: geometry)
                    }
                    .padding(.horizontal, 5)
                }
            }
        }
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.categories, id: \.0) { category in
                CategoryItem(title: category.0, icon: category.1, action: {
                    if listCoffeeBase.listCategoriesSelected.filter({ $0 == category.0 }).isEmpty {
                        listCoffeeBase.listCategoriesSelected.append(category.0)
                    } else {
                        listCoffeeBase.listCategoriesSelected.removeAll(where: { $0 == category.0 })
                    }
                })
                .padding([.horizontal, .vertical], 5)
                .alignmentGuide(.leading, computeValue: { d in
                    if (abs(width - d.width) > g.size.width)
                    {
                        width = 0
                        height -= d.height
                    }
                    let result = width
                    if let lastCategory = self.categories.last,
                       category == lastCategory {
                        width = 0 //last item
                    } else {
                        width -= d.width
                    }
                    return result
                })
                .alignmentGuide(.top, computeValue: { d in
                    let result = height
                    if let lastCategory = self.categories.last,
                       category == lastCategory {
                        height = 0 // last item
                    }
                    return result
                })
            }
        }
    }
}
