//
//  HomeViewModelTests.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//

import Foundation
import XCTest
@testable import iUser

final class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!
    var mockRepo: MockUserRepository!

    override func setUp() {
        super.setUp()
        mockRepo = MockUserRepository()
        viewModel = HomeViewModel(userRepository: mockRepo)
    }

    override func tearDown() {
        viewModel = nil
        mockRepo = nil
        super.tearDown()
    }

    func testFilteredUsers_withInput_returnsMatchingUsers() {
        // Given
        let users = [
            User(id: "1", name: "Alice", thumbImage: "", email: "alice@email.com"),
            User(id: "2", name: "Bob", thumbImage: "", email: "bob@email.com")
        ]
        viewModel.users = users
        viewModel.inputText = "ali"

        // When
        let result = viewModel.filteredUsers

        // Then
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.name, "Alice")
    }

    func testFilteredUsers_withEmptyInput_returnsAllUsers() {
        // Given
        let users = [
            User(id: "1", name: "Alice", thumbImage: "", email: "alice@email.com")
        ]
        viewModel.users = users
        viewModel.inputText = ""

        // Then
        XCTAssertEqual(viewModel.filteredUsers.count, 1)
    }

    func testFetchRandomUser_success_setsUsers() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch success")
        let users = [
            User(id: "1", name: "Alice", thumbImage: "", email: "alice@email.com")
        ]
        mockRepo.fetchRandomUsers = (true, users, nil)

        // When
        viewModel.fetchRandomUser()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // Then
            XCTAssertEqual(self.viewModel.users?.count, 1)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func testFetchRandomUser_failure_showsErrorPopup() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch failure")
        mockRepo.fetchRandomUsers = (false, nil, .noData)

        // When
        viewModel.fetchRandomUser()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // Then
            if case let .error(data) = self.viewModel.popupEvent {
                XCTAssertEqual(data.message, "No data was received from the server.")
                XCTAssertEqual(data.title, "Oops!")
                XCTAssertNotNil(data.onPrimaryAction)
                expectation.fulfill()
            } else {
                XCTFail("Expected popupEvent to be error")
            }
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
