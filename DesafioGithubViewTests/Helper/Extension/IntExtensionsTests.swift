//
//  IntExtensionsTests.swift
//  DesafioGithubViewTests
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import XCTest
@testable import DesafioGithubView

final class IntExtensionsTests: XCTestCase {
    func testAsString() throws {
        let numberA = 1234
        XCTAssertEqual(numberA.asString, "1234")
        
        let numberB = Int.max
        XCTAssertEqual(numberB.asString, "9223372036854775807")
    }
}
