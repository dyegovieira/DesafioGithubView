//
//  HTTPServiceErrorTests.swift
//  DesafioGithubViewTests
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import XCTest
@testable import DesafioGithubView

final class HTTPServiceErrorTests: XCTestCase {
    func testErrorDescription() throws {
        let value = HTTPServiceError.invalidURL("httpgooglecom")
        XCTAssertEqual(value.localizedDescription, "URL Inválida. (httpgooglecom)")
        XCTAssertNotEqual(value.localizedDescription, "")
    }
}
