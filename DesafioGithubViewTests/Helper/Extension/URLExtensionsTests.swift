//
//  URLExtensionsTests.swift
//  DesafioGithubViewTests
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import XCTest
@testable import DesafioGithubView

final class URLExtensionsTests: XCTestCase {
    func testIsValidURL() throws {
        // invalid
        
        if let url = URL(string: "httpgooglecom") {
            XCTAssertFalse(url.isValidURL)
        }
        
        if let url = URL(string: "google.com") {
            XCTAssertFalse(url.isValidURL)
        }
        
        // valid
        
        if let url = URL(string: "http://google.com") {
            XCTAssertTrue(url.isValidURL)
        }
    }
}
