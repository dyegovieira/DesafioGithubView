//
//  RemoteFetchRepoListRepositoryTests.swift
//  DesafioGithubViewTests
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import XCTest
@testable import DesafioGithubView

final class RemoteFetchRepoListRepositoryTests: XCTestCase {
    func testFetchSucces() async throws {
        let repos: [Repo] = [.init(id: 123, name: "a", description: nil, stargazers_count: nil, watchers_count: nil, forks_count: nil)]
        let service = HTTPServiceMock(response: repos)
        let repository = RemoteFetchRepoListRepository(httpService: service)
        let values = try await repository.execute(login: "login")
        XCTAssertEqual(values.count, 1)
        XCTAssertEqual(values.first?.id, 123)
        XCTAssertNotEqual(values.first?.name, "b")
        XCTAssertNil(values.first?.stargazers_count)
    }
    
    func testFetchFail() async throws {
        let repos: [Repo]? = nil
        let service = HTTPServiceMock(response: repos)
        let repository = RemoteFetchRepoListRepository(httpService: service)
        do {
            let _: [Repo] = try await repository.execute(login: "login")
        } catch let error {
            XCTAssertEqual(error.localizedDescription, "invalid request")
        }
    }
}

// MARK: - Mock

private struct HTTPServiceMock<D: Decodable>: HTTPService{
    let response: D?
    
    func data<D>(from urlString: String) async throws -> D where D : Decodable {
        if let value = self.response as? D {
            return value
        }
        
        throw NSError(domain: "", code: 0, userInfo: [ NSLocalizedDescriptionKey: "invalid request"])
    }
}
