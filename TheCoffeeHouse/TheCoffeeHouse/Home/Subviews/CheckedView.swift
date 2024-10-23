//
//  CheckedView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 23/10/24.
//

import SwiftUI

struct CheckedView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("ffff")
                .resizable()
                .scaledToFit()
                .cornerRadius(16)
                .frame(width: 60, height: 60)
            Text("Added")
                .bold()
                .font(.system(size: 24))
        }
        .padding(16)
        .background(Color.gray)
        .cornerRadius(16)
    }
}

#Preview {
    CheckedView()
}
