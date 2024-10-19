//
//  SearchView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            TextField("Search...", text: $searchText)
        }
        .font(.headline)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 24)
                .fill(.background)
                .stroke(Color.gray, lineWidth: 1)
        }
    }
}

#Preview {
    SearchView()
}
