//
//  DataExtensionsTests.swift
//  
//
//  Created by Jann Driessen on 24.06.24.
//

import XCTest
@testable import BasedUtils

final class DataExtensionsTests: XCTestCase {

    func testBase64UrlEncode() throws {
        let basicEncoding = "https://example.com".data(using: .utf8)!
        let urlWithQueryParams = "https://example.com/path?query=parameter".data(using: .utf8)!
        let urlWithSpecialCharacters = "https://example.com/path?query=param+eter&foo=bar/baz".data(using: .utf8)!
        let simpleText = "Hello world".data(using: .utf8)!
        let emptyString = "".data(using: .utf8)!
        XCTAssertEqual(basicEncoding.base64UrlEncode(), "aHR0cHM6Ly9leGFtcGxlLmNvbQ")
        XCTAssertEqual(urlWithQueryParams.base64UrlEncode(), "aHR0cHM6Ly9leGFtcGxlLmNvbS9wYXRoP3F1ZXJ5PXBhcmFtZXRlcg")
        XCTAssertEqual(urlWithSpecialCharacters.base64UrlEncode(), "aHR0cHM6Ly9leGFtcGxlLmNvbS9wYXRoP3F1ZXJ5PXBhcmFtK2V0ZXImZm9vPWJhci9iYXo")
        XCTAssertEqual(simpleText.base64UrlEncode(), "SGVsbG8gd29ybGQ")
        XCTAssertEqual(emptyString.base64UrlEncode(), "")
    }

    func testFromHex() throws {
        XCTAssertEqual(Data.fromHex("0x"), Data())
        XCTAssertEqual(Data.fromHex("0x61"), Data([97]))
        XCTAssertEqual(Data.fromHex("0x48656c6c6f20576f726c6421"), Data([72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100, 33]))
        XCTAssertEqual(Data.fromHex("0x420fggf11a"), nil)
    }

}
