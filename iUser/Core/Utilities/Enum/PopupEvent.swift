//
//  PopupEvent.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//

import Foundation

enum PopupEvent {
    case loading(Bool)
    case error(PopupData)
    case info(PopupData)
    case dismiss
}
