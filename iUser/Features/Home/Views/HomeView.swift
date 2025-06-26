//
//  HomeView.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var homeVM = HomeViewModel()
    @EnvironmentObject var popupManager: PopupManager
    
    var body: some View {
        NavigationView {
            if let users = homeVM.users {
                List(users, id: \.id) { user in
                    NavigationLink(destination: UserDetailView(userEmail: user.email )) {
                        HStack {
                            AsyncImage(url: URL(string: user.thumbImage)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            
                            Text(user.name)
                        }
                    }
                    
                }
            }
        }
        .refreshable {
            homeVM.fetchRandomUser()
        }
        .onAppear(){
            homeVM.fetchRandomUser()
        }
        .onReceive(homeVM.$popupEvent) { event in
            switch event {
            case .loading(let isLoading):
                popupManager.loading(isLoading: isLoading)
            case .error(let data), .info(let data):
                popupManager.showPopup(data: data)
            case .dismiss:
                break
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}

