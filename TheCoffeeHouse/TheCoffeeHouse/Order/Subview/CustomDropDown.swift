//
//  CustomDropDown.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import SwiftUI

struct CustomDropdownWithIcons: View {
    @State private var isDropdownOpen = false
    @State private var selectedOption = "ApplePay"
    @State private var selectedOptionIcon = "apple pay"
    
    let options = [("ApplePay", "apple pay"), ("VISA/MasterCard", "visa"), ("Cash", "cash")]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Dropdown button
            Button(action: {
                withAnimation {
                    isDropdownOpen.toggle()
                }
            }) {
                HStack {
                    Image(selectedOptionIcon)
                    Text(selectedOption)
                        .foregroundColor(.black)
                        .bold()
                        .font(.subheadline)
                    Spacer()
                    Image(systemName: isDropdownOpen ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            }
            
            // Dropdown options
            if isDropdownOpen {
                VStack(spacing: 4) {
                    ForEach(options, id: \.0) { option in
                        Button(action: {
                            selectedOptionIcon = option.1
                            selectedOption = option.0
                            isDropdownOpen = false
                        }) {
                            HStack {
                                Image(option.1)
                                    .foregroundColor(.blue)
                                Text(option.0)
                                    .foregroundColor(.black)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .cornerRadius(8)
                .padding(.top, 4)
            }
        }
    }
}

#Preview {
    CustomDropdownWithIcons()
}
