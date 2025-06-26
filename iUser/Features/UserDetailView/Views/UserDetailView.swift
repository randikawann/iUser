//
//  UserDetailView.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//

import SwiftUI

struct UserDetailView: View {
    @StateObject private var userDetailVM = UserDetailViewModel()
    
    @EnvironmentObject var popupManager: PopupManager
    
    let userEmail: String
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if let user = userDetailVM.user {
                    AsyncImage(url: URL(string: user.largeImage)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    
                    Text(user.fullName).font(.title)
                    Text(user.email).foregroundColor(.secondary)
                    Text(user.phone).foregroundColor(.secondary)
                    
                    Spacer()
                } else {
                    Text("xcvbcvbrxctvyb").foregroundColor(.secondary)
                }
            }
        }
        .onAppear(){
            userDetailVM.fetchSelectedUser(userEmail: userEmail)
        }
        .onReceive(userDetailVM.$popupEvent) { event in
            switch event {
            case .loading(let isLoading):
                popupManager.loading(isLoading: isLoading)
            case .error(let data), .info(let data):
                popupManager.showPopup(data: data)
            case .dismiss:
                break
            }
        }
        .padding()
        .navigationTitle("Details")
    }
}

#Preview {
    UserDetailView(userEmail: "").environmentObject(PopupManager.shared)
        .overlay(
            PopupView()
                .environmentObject(PopupManager.shared)
        )
}
