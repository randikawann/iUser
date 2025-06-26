//
//  HomeViewModel.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//
import Foundation

class HomeViewModel: ObservableObject {
    
    
    private let userRepository: UserRepositoryProtocol
    @Published var users: [User]?
    @Published var popupEvent: PopupEvent = .dismiss
    
    init(userRepository: UserRepositoryProtocol = UserRepository()) {
        self.userRepository = userRepository
    }
    
    func fetchRandomUser() {
        self.popupEvent = .loading(true)
        userRepository.fetchRandomUsers() { [weak self] isSuccess, user, error in
            DispatchQueue.main.async {
                self?.popupEvent = .loading(false)
                if isSuccess && user != nil {
                    self?.users = user
                } else {
                    self?.showErrorPopup(
                        message: error?.localizedDescription ?? NSLocalizedString("Something went wrong", comment: ""), retryAction: { self?.fetchRandomUser() }
                    )
                }
            }
        }
    }
}

extension HomeViewModel {
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
