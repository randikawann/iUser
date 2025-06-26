//
//  MockUserRepository.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//

import XCTest
@testable import iUser

class MockUserRepository: UserRepositoryProtocol {
    
    var fetchRandomUsers: (Bool, [User]?, NetworkError?)?
    var fetchSelectedUser: (Bool, UserDetail?, NetworkError?)?

    
    func fetchRandomUsers(completion: @escaping (Bool, [User]?, NetworkError?) -> Void) {
        if let result = fetchRandomUsers {
            completion(result.0, result.1, result.2)
        } else {
            completion(false, nil, nil)
        }
    }
    
    func fetchSelectedUser(id: String, completion: @escaping (Bool, UserDetail?, NetworkError?) -> Void) {
        if let result = fetchSelectedUser {
            completion(result.0, result.1, result.2)
        } else {
            completion(false, nil, nil)
        }
    }
}
