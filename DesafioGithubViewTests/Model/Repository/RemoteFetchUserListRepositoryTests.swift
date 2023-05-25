//
//  RemoteFetchUserListRepositoryTests.swift
//  DesafioGithubViewTests
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import XCTest
@testable import DesafioGithubView

final class RemoteFetchUserListRepositoryTests: XCTestCase {
    func testFetchSucces() async throws {
        let repos: [User] = [.init(id: 123, login: "abc", avatar_url: nil)]
        let service = HTTPServiceMock(response: repos)
        let repository = RemoteFetchUserListRepository(httpService: service)
        let values = try await repository.execute()
        XCTAssertEqual(values.count, 1)
        XCTAssertEqual(values.first?.id, 123)
        XCTAssertNotEqual(values.first?.login, "efg")
        XCTAssertNil(values.first?.avatar_url)
    }
    
    func testFetchFail() async throws {
        let repos: [User]? = nil
        let service = HTTPServiceMock(response: repos)
        let repository = RemoteFetchUserListRepository(httpService: service)
        do {
            let _: [User] = try await repository.execute()
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
