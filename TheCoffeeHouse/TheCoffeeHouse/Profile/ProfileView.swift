//
//  ProfileView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 16/10/24.
//

import SwiftUI

struct ProfileView: View {
    private var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            VStack {
                Image("profile-image")
                    .resizable()
                    .frame(width: 120, height: 120)
                HStack {
                    Text(viewModel.username)
                        .font(.title2)
                        .bold()
                    Image(systemName: "pencil.line")
                }
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Setting")
                    .font(.title)
                    .bold()
                
                HStack {
                    Image(systemName: "phone")
                    Text(viewModel.phoneNumber)
                    Spacer()
                    Image(systemName: "pencil.line")
                }
                
                HStack {
                    Image(systemName: "mappin.circle")
                    Text(viewModel.address)
                    Spacer()
                    Image(systemName: "pencil.line")
                }
                
                HStack {
                    Spacer()
                    Text("Logout")
                        .padding()
                    Image(systemName: "arrow.right.to.line")
                }
                .foregroundStyle(Color(hex: "#CB8A58") ?? .black)
                .bold()
                .font(.title3)
                
            }
            Spacer()
        }
        .padding(32)
    }
}

#Preview {
    ProfileView()
}
