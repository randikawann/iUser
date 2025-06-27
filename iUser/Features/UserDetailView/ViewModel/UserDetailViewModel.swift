//
//  UserDetailViewModel.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//
import Foundation

class UserDetailViewModel: ObservableObject {
    
    private let userRepository: UserRepositoryProtocol
    @Published var user: User?
    @Published var popupEvent: PopupEvent = .dismiss
    
    init(userRepository: UserRepositoryProtocol = UserRepository()) {
        self.userRepository = userRepository
    }
    
    func fetchSelectedUser(user: User) {
        self.user = user
    }
}
