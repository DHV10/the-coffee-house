//
//  AddressView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 17/10/24.
//

import SwiftUI

struct AddressView: View {
    @State var location: String = "This is address for testing"
    
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle")
            Text(location)
                .font(.headline)
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: "phone")
        }
        .padding(.horizontal)
    }
}

#Preview {
    AddressView()
}
