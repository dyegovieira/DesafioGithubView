//
//  UserDetailViewModelTests.swift
//  DesafioGithubViewTests
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import XCTest
@testable import DesafioGithubView

final class UserDetailViewModelTests: XCTestCase {
    private let user = User(id: 132, login: "abc", avatar_url: nil)
    
    func testRefreshUserListSuccces() throws {
        let expectation: XCTestExpectation = .init(description: "testRefreshUserListSuccces")
        let repository = MockFetchUserDetailRepository(doFail: false)
        let viewModel = ImplUserDetailViewModel(user: user, fetchUserDetailRepository: repository)
        viewModel.refreshUserDetail()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(viewModel.userDetail.name, "joao")
            XCTAssertEqual(viewModel.userDetail.followers, 999)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.3)
    }
    
    func testRefreshUserListFail() throws {
        let expectation: XCTestExpectation = .init(description: "testRefreshUserListFail")
        let repository = MockFetchUserDetailRepository(doFail: true)
        let viewModel = ImplUserDetailViewModel(user: user, fetchUserDetailRepository: repository)
        viewModel.refreshUserDetail()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(viewModel.error.localizedDescription, "invalid request")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.3)
    }
}

// MARK: - Mock

private struct MockFetchUserDetailRepository: FetchUserDetailRepository {
    let doFail: Bool
    
    func execute(login: String) async throws -> DesafioGithubView.UserDetail {
        if doFail {
            throw NSError(domain: "", code: 0, userInfo: [ NSLocalizedDescriptionKey: "invalid request"])
        } else {
            return .init(id: 123, login: "abc", name: "joao", avatar_url: nil, location: nil, company: nil, created_at: nil, public_repos: nil, public_gists: nil, followers: 999, following: nil)
        }
    }
}
