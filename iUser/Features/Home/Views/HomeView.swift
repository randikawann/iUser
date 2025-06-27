//
//  HomeView.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var homeVM = HomeViewModel()
    @EnvironmentObject var popupManager: PopupManager
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("iUser")
                    .font(.largeTitle).bold()
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                
                CommonTextField(hint: "Search by name", value: $homeVM.inputText)
                    .padding(.horizontal, 16)
                
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(homeVM.filteredUsers, id: \.id) { user in
                            NavigationLink(destination: UserDetailView(user: user)) {
                                HStack(spacing: 16) {
                                    AsyncImage(url: URL(string: user.thumbImage)) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                    .shadow(radius: 3)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(user.name)
                                            .font(.headline)
                                            .foregroundColor(.primary)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(16)
                                .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                                .padding(.horizontal, 16)
                            }
                        }
                    }
                    .padding(.top, 8)
                }
            }
            .background(Color(.systemGroupedBackground))
            .navigationBarHidden(true)
        }
        .refreshable {
            homeVM.fetchRandomUser()
        }
        .onAppear {
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
    }
}


#Preview {
    HomeView().environmentObject(PopupManager.shared)
        .overlay(
            PopupView()
                .environmentObject(PopupManager.shared)
        )
}

