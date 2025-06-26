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
    
    func testFetchSelectedUser_success_setsUser() {
        // Given
        let expectedUser = UserDetail(id: "", name: "Test User", largeImage: "", email: "test@example.com", fullName: "Mr Test User", phone: "123")
        
        mockRepo.fetchSelectedUser = (true, expectedUser, nil)
        let expectation = XCTestExpectation(description: "User detail loaded")
        
        // When
        viewModel.fetchSelectedUser(userEmail: "test@example.com")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // Then
            XCTAssertEqual(self.viewModel.user?.email, "test@example.com")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testFetchSelectedUser_failure_showsErrorPopup() {
        // Given
        mockRepo.fetchSelectedUser = (false, nil, .noData)
        let expectation = XCTestExpectation(description: "Error popup triggered")
        
        // When
        viewModel.fetchSelectedUser(userEmail: "missing@example.com")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // Then
            if case let .error(popupData) = self.viewModel.popupEvent {
                XCTAssertEqual(popupData.message, "No data was received from the server.")
                XCTAssertEqual(popupData.title, "Oops!")
                XCTAssertNotNil(popupData.onPrimaryAction)
                expectation.fulfill()
            } else {
                XCTFail("Expected popupEvent to be error")
            }
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
