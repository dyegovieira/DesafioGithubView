//
//  ImplRepoListViewModelTests.swift
//  DesafioGithubViewTests
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import XCTest
@testable import DesafioGithubView

final class ImplRepoListViewModelTests: XCTestCase {
    func testRefreshRepoListSuccces() throws {
        let expectation: XCTestExpectation = .init(description: "testRefreshRepoListSuccces")
        let repository = MockFetchRepoListRepository(doFail: false)
        let viewModel = ImplRepoListViewModel(login: "login", fetchRepoListRepository: repository)
        XCTAssertEqual(viewModel.repoList.count, 3) // placeholder
        viewModel.refreshRepoList()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(viewModel.repoList.count, 1)
            XCTAssertEqual(viewModel.repoList.first?.id, 123)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.3)
    }
    
    func testRefreshRepoListFail() throws {
        let expectation: XCTestExpectation = .init(description: "testRefreshRepoListFail")
        let repository = MockFetchRepoListRepository(doFail: true)
        let viewModel = ImplRepoListViewModel(login: "login", fetchRepoListRepository: repository)
        viewModel.refreshRepoList()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(viewModel.error.localizedDescription, "invalid request")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.3)
    }
}

// MARK: - Mock

private struct MockFetchRepoListRepository: FetchRepoListRepository {
    let doFail: Bool
    
    func execute(login: String) async throws -> [DesafioGithubView.Repo] {
        if doFail {
            throw NSError(domain: "", code: 0, userInfo: [ NSLocalizedDescriptionKey: "invalid request"])
        } else {
            return [.init(id: 123, name: "abc", description: nil, stargazers_count: nil, watchers_count: nil, forks_count: nil)]
        }
    }
}
