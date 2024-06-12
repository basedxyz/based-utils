//
//  StringExtensionsTests.swift
//  
//
//  Created by Jann Driessen on 12.06.24.
//

import XCTest

@testable import BasedUtils

final class StringExtensionsTests: XCTestCase {

    func testAddHexPrefix() throws {
        let address = "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045"
        let hash = "d8dA6BF26964aF9D7eEd9e03E53415D37aA96045"
        let hash2 = "d8dA6B"
        let result = hash.addHexPrefix()
        let result2 = hash2.addHexPrefix()
        let result3 = "".addHexPrefix()
        let resultAddress = address.addHexPrefix()
        XCTAssertEqual(result, "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045")
        XCTAssertEqual(result2, "0xd8dA6B")
        XCTAssertEqual(result3, "0x")
        XCTAssertEqual(resultAddress, address, "should not add a prefix if one exists")
    }

    func testStripHexPrefix() throws {
        let address = "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045"
        let hex = "0xd8dA6B"
        let stripped = address.removeHexPrefix()
        let strippedHex = hex.removeHexPrefix()
        let result = "d8dA6B".removeHexPrefix()
        XCTAssertEqual(stripped, "d8dA6BF26964aF9D7eEd9e03E53415D37aA96045")
        XCTAssertEqual(strippedHex, "d8dA6B")
        XCTAssertEqual(result, "d8dA6B", "should not remove a prefix if none exists")
    }

}
