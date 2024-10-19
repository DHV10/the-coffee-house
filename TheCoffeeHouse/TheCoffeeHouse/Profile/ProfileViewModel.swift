//
//  ProfileViewModel.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var username: String = "Lores DHV"
    @Published var phoneNumber: String = "90234203482"
    @Published var address: String = "Ukraine, Ivano-Frankivsk, Kon..."
}
