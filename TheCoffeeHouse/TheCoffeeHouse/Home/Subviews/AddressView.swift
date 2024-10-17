//
//  AddressView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 17/10/24.
//

import SwiftUI

struct AddressView: View {
    @State var address: String = "This is address for testing"
    
    var body: some View {
        HStack {
            Image(systemName: "mappin.and.ellipse")
            Text(address)
                .font(.subheadline)
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: "phone.fill")
        }
        .padding(.horizontal)
    }
}

#Preview {
    AddressView()
}
