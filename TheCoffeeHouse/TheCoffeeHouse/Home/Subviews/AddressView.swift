//
//  AddressView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 17/10/24.
//

import SwiftUI

struct AddressView: View {
    @State var location: String = "FPT Software, Tan Xa, Thach That, Ha Noi"
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle")
            Text(location)
                .font(.headline)
                .fontWeight(.semibold)
                .lineLimit(1)
            Spacer()
            Image(systemName: "phone")
        }
        .foregroundStyle(.black)
        .padding(.horizontal)
    }
}

#Preview {
    AddressView()
}
