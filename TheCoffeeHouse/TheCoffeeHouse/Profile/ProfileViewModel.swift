//
//  ProfileViewModel.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var username: String = "Lores Amend"
    @Published var phoneNumber: String = "0919508351"
    @Published var address: String = "FPT Software, Tan Xa, Thach That, Ha Noi"
}
