//
//  PopupData.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//

import Foundation

struct PopupData {
    let image: String
    let title: String
    let message: String
    let primaryButtonTitle: String
    let secondaryButtonTitle: String
    let showCloseButton: Bool
    let onPrimaryAction: (() -> Void)?
    let onSecondaryAction: (() -> Void)?
    
    init(
        image: String = "error_image",
        title: String = "",
        message: String = "",
        primaryButtonTitle: String = "",
        secondaryButtonTitle: String = "",
        showCloseButton: Bool = false,
        onPrimaryAction: (() -> Void)? = nil,
        onSecondaryAction: (() -> Void)? = nil
    ) {
        self.image = image
        self.title = title
        self.message = message
        self.primaryButtonTitle = primaryButtonTitle
        self.secondaryButtonTitle = secondaryButtonTitle
        self.showCloseButton = showCloseButton
        self.onPrimaryAction = onPrimaryAction
        self.onSecondaryAction = onSecondaryAction
    }
}
