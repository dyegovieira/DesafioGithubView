//
//  StringExtensionsTests.swift
//  DesafioGithubViewTests
//
//  Created by Dyego Vieira de Paula on 24/05/23.
//

import XCTest
@testable import DesafioGithubView

final class StringExtensionsTests: XCTestCase {
    func testAsDateValid() throws {
        let dateA = "2023-05-24T20:30:45Z".asDate
        XCTAssertNotNil(dateA)
        
        if let date = dateA {
            var calendar = Calendar.current
            calendar.timeZone = TimeZone(identifier: "UTC")!
            XCTAssertEqual(calendar.component(.year, from: date), 2023)
            XCTAssertEqual(calendar.component(.month, from: date), 5)
            XCTAssertEqual(calendar.component(.day, from: date), 24)
            XCTAssertEqual(calendar.component(.hour, from: date), 20)
            XCTAssertEqual(calendar.component(.minute, from: date), 30)
            XCTAssertEqual(calendar.component(.second, from: date), 45)
        }
    }
    
    func testAsDateInvalid() throws {
        let dateA = "2023-05-24T20:30Z".asDate
        XCTAssertNil(dateA)
        
        let dateB = "2023-05T20:30:45Z".asDate
        XCTAssertNil(dateB)
        
        let dateC = "2023-05-24 20:30:45Z".asDate
        XCTAssertNil(dateC)
    }
}
