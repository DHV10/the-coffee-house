//
//  UserProfileModel.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 16/10/24.
//

import Foundation

class UserProfileModel: ObservableObject {
    @Published var username: String = ""
    @Published var phoneNumber: String = ""
}
