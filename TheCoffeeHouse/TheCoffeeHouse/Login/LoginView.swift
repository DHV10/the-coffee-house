//
//  LoginView.swift
//  TheCoffeeHouse
//
//  Created by Việt Dương Hoàng on 16/10/24.
//

import SwiftUI

struct LoginView: View {
    @State private var profile: UserProfileModel = UserProfileModel()
    
    var body: some View {
        ZStack {
            Color(hex: "#B29F91")
            VStack {
                Image("backgroundLoginTop")
                Spacer()
                Image("backgroundLoginBot")
            }
            
            Image("backgroundLoginMid")
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 2) {
                Spacer()
                
                Text("Welcome back!")
                    .font(.system(size: 36))
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                
                Text("Login to your account")
                    .font(.system(size: 24))
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 40)
                
                Text("Username")
                    .font(.system(size: 18))
                
                TextField("", text: $profile.username)
                    .padding([.vertical, .trailing])
                    .padding(.leading, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.bottom, 20)
                
                Text("Phone number")
                    .font(.system(size: 18))
                
                TextField("", text: $profile.phoneNumber)
                    .keyboardType(.numberPad)
                    .padding([.vertical, .trailing])
                    .padding(.leading, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.bottom, 40)
                
                Button {
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 56)
                            .cornerRadius(16)
                            .foregroundStyle(Color(hex: "#422110") ?? .blue)
                        
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
                Spacer()
            }
            .padding(40)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}
