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
    
    let user: User
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if let user = userDetailVM.user {
                    AsyncImage(url: URL(string: user.largeImage)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                    } placeholder: {
                        ProgressView().frame(maxWidth: .infinity, maxHeight: 200)
                    }
                    Text(user.fullName).font(.title)
                    Text(user.email).foregroundColor(.secondary)
                    Text(user.phone).foregroundColor(.secondary)
                    Spacer()
                } else {
                    ProgressView().frame(maxWidth: .infinity, maxHeight: 200)
                    Text("Full Name").font(.title)
                    Text("Email").foregroundColor(.secondary)
                    Text("Phone").foregroundColor(.secondary)
                    Spacer()
                }
            }
        }
        .onAppear(){
            userDetailVM.fetchSelectedUser(user: user)
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
    PreviewUserDetailView()
}

struct PreviewUserDetailView: View {
    let user =  User(id: "", name: "", email: "", largeImage: "", thumbImage: "", fullName: "", phone: "")
    
    var body: some View {
        UserDetailView(user: user).environmentObject(PopupManager.shared)
            .overlay(
                PopupView()
                    .environmentObject(PopupManager.shared)
            )
    }
}
