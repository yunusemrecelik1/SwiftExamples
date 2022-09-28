//
//  CurrencyFormatterTest.swift
//  BankeyUnitTests
//
//  Created by Yunus Emre Çelik on 26.09.2022.
//

import Foundation

import XCTest

@testable import Bankey

class Test: XCTestCase {
    var formatter: CurrencyFormatter!
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testShouldBeVisible() throws {
        let result = formatter.breakIntoDollarsAndCents(929466.23)
        XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
    
    func testDollarFormatted() throws {
        let result = formatter.dollarsFormatted(929466)
        XCTAssertEqual(result, "$929,466.00")
    }
    
    func testZeroDollarsFormatted() throws {
        
    }
}
