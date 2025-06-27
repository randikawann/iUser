//
//  UserDetailViewModelTests.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//

import XCTest
@testable import iUser

final class UserDetailViewModelTests: XCTestCase {
    
    var viewModel: UserDetailViewModel!
    var mockRepo: MockUserRepository!
    
    override func setUp() {
        super.setUp()
        mockRepo = MockUserRepository()
        viewModel = UserDetailViewModel(userRepository: mockRepo)
    }
    
    override func tearDown() {
        viewModel = nil
        mockRepo = nil
        super.tearDown()
    }
}
