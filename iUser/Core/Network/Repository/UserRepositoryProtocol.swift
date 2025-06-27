//
//  UserRepositoryProtocol.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//

import Foundation

protocol UserRepositoryProtocol {
    func fetchRandomUsers(completion: @escaping (Bool, [User]?, NetworkError?) -> Void)
}
