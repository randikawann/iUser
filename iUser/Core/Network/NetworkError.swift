//
//  NetworkError.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case custom(Error)
    case defaultError
}
