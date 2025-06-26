//
//  UserDetailView.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//

import SwiftUI

struct UserDetailView: View {
    @StateObject private var homeVM = HomeViewModel()
    @EnvironmentObject var popupManager: PopupManager
    let userID: String
    
    var body: some View {
        NavigationView {
            Text("UserDetailView \(userID)")
        }
    }
}

#Preview {
    UserDetailView(userID: "")
}
