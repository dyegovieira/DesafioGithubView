//
//  URLSessionHTTPServiceTests.swift
//  DesafioGithubViewTests
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import XCTest
@testable import DesafioGithubView

final class URLSessionHTTPServiceTests: XCTestCase {
    func testDataSuccess() async throws {
        let session = URLSessionMock(response: "teste")
        let service = URLSessionHTTPService(session: session)
        let object: String = try await service.data(from: "http://google.com")
        XCTAssertEqual(object, "teste")
        XCTAssertNotEqual(object, "")
    }
    
    func testInvalidURL() async throws {
        let session = URLSessionMock(response: "")
        let service = URLSessionHTTPService(session: session)

        do {
            let _: String = try await service.data(from: "httpgooglecom")
        } catch let error {
            XCTAssertEqual(error.localizedDescription, "URL Inválida. (httpgooglecom)")
        }
    }
}

// MARK: - Mock

private struct URLSessionMock: URLSessionProtocol {
    let response: String
    
    func getData(from url: URL) async throws -> (Data, URLResponse) {
        let encoder = JSONEncoder()
        let data = try encoder.encode(response)
        return (data, .init())
    }
}
