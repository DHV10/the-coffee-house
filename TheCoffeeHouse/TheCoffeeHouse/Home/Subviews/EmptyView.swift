//
//  EmptyView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 22/10/24.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("more")
                .resizable()
                .scaledToFit()
                .cornerRadius(16)
                .frame(width: 180, height: 180)
            Text("Order to enjoy!")
                .font(.system(size: 24))
        }
    }
}

#Preview {
    EmptyView()
}
