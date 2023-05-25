//
//  ImplUserListViewModelTests.swift
//  DesafioGithubViewTests
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import XCTest
@testable import DesafioGithubView

final class ImplUserListViewModelTests: XCTestCase {
    func testRefreshUserListSuccces() throws {
        let expectation: XCTestExpectation = .init(description: "testRefreshUserListSuccces")
        let repository = MockFetchUserListRepository(doFail: false)
        let viewModel = ImplUserListViewModel(fetchUserListRepository: repository)
        XCTAssertEqual(viewModel.userList.count, 6) // placeholder
        viewModel.refreshUserList()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(viewModel.userList.count, 1)
            XCTAssertEqual(viewModel.userList.first?.id, 123)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.3)
    }
    
    func testRefreshUserListFail() throws {
        let expectation: XCTestExpectation = .init(description: "testRefreshUserListFail")
        let repository = MockFetchUserListRepository(doFail: true)
        let viewModel = ImplUserListViewModel(fetchUserListRepository: repository)
        viewModel.refreshUserList()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(viewModel.error.localizedDescription, "invalid request")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.3)
    }
}

// MARK: - Mock

private struct MockFetchUserListRepository: FetchUserListRepository {
    let doFail: Bool
    
    func execute() async throws -> [DesafioGithubView.User] {
        if doFail {
            throw NSError(domain: "", code: 0, userInfo: [ NSLocalizedDescriptionKey: "invalid request"])
        } else {
            return [.init(id: 123, login: "abc", avatar_url: nil)]
        }
    }
}
