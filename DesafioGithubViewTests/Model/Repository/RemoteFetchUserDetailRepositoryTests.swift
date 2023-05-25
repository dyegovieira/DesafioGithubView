//
//  RemoteFetchUserDetailRepositoryTests.swift
//  DesafioGithubViewTests
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import XCTest
@testable import DesafioGithubView

final class RemoteFetchUserDetailRepositoryTests: XCTestCase {
    func testFetchSucces() async throws {
        let repos: UserDetail = .init(id: 123, login: "", name: "joao", avatar_url: nil, location: nil, company: nil, created_at: nil, public_repos: nil, public_gists: nil, followers: nil, following: nil)
        let service = HTTPServiceMock(response: repos)
        let repository = RemoteFetchUserDetailRepository(httpService: service)
        let value = try await repository.execute(login: "login")
        XCTAssertEqual(value.id, 123)
        XCTAssertNotEqual(value.name, "maria")
        XCTAssertNil(value.avatar_url)
    }
    
    func testFetchFail() async throws {
        let repos: UserDetail? = nil
        let service = HTTPServiceMock(response: repos)
        let repository = RemoteFetchUserDetailRepository(httpService: service)
        do {
            let _: UserDetail = try await repository.execute(login: "login")
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
