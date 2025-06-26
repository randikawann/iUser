//
//  UserDetailViewModel.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//
import Foundation

class UserDetailViewModel: ObservableObject {
    
    private let userRepository: UserRepositoryProtocol
    @Published var user: UserDetail?
    @Published var popupEvent: PopupEvent = .dismiss
    
    init(userRepository: UserRepositoryProtocol = UserRepository()) {
        self.userRepository = userRepository
    }
    
    func fetchSelectedUser(userEmail: String) {
        self.popupEvent = .loading(true)
        userRepository.fetchSelectedUser(id: userEmail) { [weak self] isSuccess, user, error in
            DispatchQueue.main.async {
                self?.popupEvent = .loading(false)
                if isSuccess && user != nil {
                    self?.user = user
                } else {
                    self?.showErrorPopup(
                        message: error?.localizedDescription ?? NSLocalizedString("Something went wrong", comment: ""), retryAction: { self?.fetchSelectedUser(userEmail: userEmail) }
                    )
                }
            }
        }
    }
}

extension UserDetailViewModel {
    private func showErrorPopup(message: String, retryAction: @escaping () -> Void) {
        self.popupEvent = .error(PopupData(
            image: "error_image",
            title: NSLocalizedString("Oops!", comment: ""),
            message: message,
            primaryButtonTitle: NSLocalizedString("Retry", comment: ""),
            secondaryButtonTitle: NSLocalizedString("Cancel", comment: ""),
            onPrimaryAction: retryAction
        ))
    }
}
