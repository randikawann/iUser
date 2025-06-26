//
//  PopupManager.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//

import Foundation

class PopupManager: ObservableObject {
    static let shared = PopupManager()
    
    @Published var isPresented: Bool = false
    @Published var isLoading: Bool = false
    @Published var popupData: PopupData = PopupData(image: "", title: "", message: "", primaryButtonTitle: "", secondaryButtonTitle: "", showCloseButton: false, onPrimaryAction: {}, onSecondaryAction: {})
    
    private init() {}
    
    func showPopup(data: PopupData) {
        self.popupData = data
        self.isPresented = true
    }
    
    func loading(isLoading: Bool){
        self.isLoading = isLoading
    }
    
    func dismiss() {
        self.isPresented = false
    }
}
