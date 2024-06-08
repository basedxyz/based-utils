//
//  ParseEtherTests.swift
//  
//
//  Created by Jann Driessen on 08.06.24.
//

import BigInt
import XCTest

@testable import BasedUtils

final class ParseEtherTests: XCTestCase {

    func testParseEtherWei() throws {
        XCTAssertEqual(BasedUtils.parseEther("6942069420.12345678912345"), BigInt("6942069420123456789123450000"))
        XCTAssertEqual(BasedUtils.parseEther("6942069420"), BigInt("6942069420000000000000000000"))
        XCTAssertEqual(BasedUtils.parseEther("1"), BigInt("1000000000000000000"))
        XCTAssertEqual(BasedUtils.parseEther("0.5"), BigInt("500000000000000000"))
        XCTAssertEqual(BasedUtils.parseEther("0.1"), BigInt("100000000000000000"))
        XCTAssertEqual(BasedUtils.parseEther("0.01"), BigInt("10000000000000000"))
        XCTAssertEqual(BasedUtils.parseEther("0.001"), BigInt("1000000000000000"))
        XCTAssertEqual(BasedUtils.parseEther("0.0001"), BigInt("100000000000000"))
        XCTAssertEqual(BasedUtils.parseEther("0.00001"), BigInt("10000000000000"))
        XCTAssertEqual(BasedUtils.parseEther("0.00000000001"), BigInt("10000000"))
        XCTAssertEqual(BasedUtils.parseEther("0.000000000001"), BigInt("1000000"))
        XCTAssertEqual(BasedUtils.parseEther("0.0000000000001"), BigInt("100000"))
        XCTAssertEqual(BasedUtils.parseEther("0.00000000000001"), BigInt("10000"))
        XCTAssertEqual(BasedUtils.parseEther("0.000000000000001"), BigInt("1000"))
        XCTAssertEqual(BasedUtils.parseEther("0.0000000000000001"), BigInt("100"))
        XCTAssertEqual(BasedUtils.parseEther("0.00000000000000001"), BigInt("10"))
        XCTAssertEqual(BasedUtils.parseEther("0.000000000000000001"), BigInt("1"))
        XCTAssertEqual(BasedUtils.parseEther("-6942069420.12345678912345"), BigInt("-6942069420123456789123450000"))
        XCTAssertEqual(BasedUtils.parseEther("-6942069420"), BigInt("-6942069420000000000000000000"))
        XCTAssertEqual(BasedUtils.parseEther("-1"), BigInt("-1000000000000000000"))
        XCTAssertEqual(BasedUtils.parseEther("-0.5"), BigInt("-500000000000000000"))
        XCTAssertEqual(BasedUtils.parseEther("-0.1"), BigInt("-100000000000000000"))
        XCTAssertEqual(BasedUtils.parseEther("-0.00000000001"), BigInt("-10000000"))
        XCTAssertEqual(BasedUtils.parseEther("-0.000000000001"), BigInt("-1000000"))
        XCTAssertEqual(BasedUtils.parseEther("-0.0000000000001"), BigInt("-100000"))
        XCTAssertEqual(BasedUtils.parseEther("-0.00000000000001"), BigInt("-10000"))
        XCTAssertEqual(BasedUtils.parseEther("-0.000000000000001"), BigInt("-1000"))
        XCTAssertEqual(BasedUtils.parseEther("-0.0000000000000001"), BigInt("-100"))
        XCTAssertEqual(BasedUtils.parseEther("-0.00000000000000001"), BigInt("-10"))
        XCTAssertEqual(BasedUtils.parseEther("-0.000000000000000001"), BigInt("-1"))
    }

    func testParseEtherGwei() throws {
        XCTAssertEqual(BasedUtils.parseEther("69420.1234567", .gwei), BigInt("69420123456700"))
        XCTAssertEqual(BasedUtils.parseEther("69420", .gwei), BigInt("69420000000000"))
        XCTAssertEqual(BasedUtils.parseEther("1", .gwei), BigInt("1000000000"))
        XCTAssertEqual(BasedUtils.parseEther("0.5", .gwei), BigInt("500000000"))
        XCTAssertEqual(BasedUtils.parseEther("0.1", .gwei), BigInt("100000000"))
        XCTAssertEqual(BasedUtils.parseEther("0.01", .gwei), BigInt("10000000"))
        XCTAssertEqual(BasedUtils.parseEther("0.001", .gwei), BigInt("1000000"))
        XCTAssertEqual(BasedUtils.parseEther("0.0001", .gwei), BigInt("100000"))
        XCTAssertEqual(BasedUtils.parseEther("0.00001", .gwei), BigInt("10000"))
        XCTAssertEqual(BasedUtils.parseEther("0.000001", .gwei), BigInt("1000"))
        XCTAssertEqual(BasedUtils.parseEther("0.0000001", .gwei), BigInt("100"))
        XCTAssertEqual(BasedUtils.parseEther("0.00000001", .gwei), BigInt("10"))
        XCTAssertEqual(BasedUtils.parseEther("0.000000001", .gwei), BigInt("1"))
        XCTAssertEqual(BasedUtils.parseEther("-6942060.123456", .gwei), BigInt("-6942060123456000"))
        XCTAssertEqual(BasedUtils.parseEther("-6942069420", .gwei), BigInt("-6942069420000000000"))
        XCTAssertEqual(BasedUtils.parseEther("-1", .gwei), BigInt("-1000000000"))
        XCTAssertEqual(BasedUtils.parseEther("-0.5", .gwei), BigInt("-500000000"))
        XCTAssertEqual(BasedUtils.parseEther("-0.1", .gwei), BigInt("-100000000"))
        XCTAssertEqual(BasedUtils.parseEther("-0.01", .gwei), BigInt("-10000000"))
        XCTAssertEqual(BasedUtils.parseEther("-0.001", .gwei), BigInt("-1000000"))
        XCTAssertEqual(BasedUtils.parseEther("-0.0001", .gwei), BigInt("-100000"))
        XCTAssertEqual(BasedUtils.parseEther("-0.00001", .gwei), BigInt("-10000"))
        XCTAssertEqual(BasedUtils.parseEther("-0.000001", .gwei), BigInt("-1000"))
        XCTAssertEqual(BasedUtils.parseEther("-0.0000001", .gwei), BigInt("-100"))
        XCTAssertEqual(BasedUtils.parseEther("-0.00000001", .gwei), BigInt("-10"))
        XCTAssertEqual(BasedUtils.parseEther("-0.000000001", .gwei), BigInt("-1"))
    }

    func testParseEtherWeiRounded() throws {
        XCTAssertEqual(BasedUtils.parseEther("0.0000000000000000001"), BigInt("0"))
        XCTAssertEqual(BasedUtils.parseEther("0.00000000000000000059"), BigInt("1"))
        XCTAssertEqual(BasedUtils.parseEther("1.00000000000000000059"), BigInt("1000000000000000001"))
        XCTAssertEqual(BasedUtils.parseEther("69.59000000000000000059"), BigInt("69590000000000000001"))
        XCTAssertEqual(BasedUtils.parseEther("1.2345678000000000912345222"), BigInt("1234567800000000091"))
        XCTAssertEqual(BasedUtils.parseEther("-0.0000000000000000001"), BigInt("0"))
        XCTAssertEqual(BasedUtils.parseEther("-0.00000000000000000059"), BigInt("-1"))
        XCTAssertEqual(BasedUtils.parseEther("-1.00000000000000000059"), BigInt("-1000000000000000001"))
        XCTAssertEqual(BasedUtils.parseEther("-69.59000000000000000059"), BigInt("-69590000000000000001"))
        XCTAssertEqual(BasedUtils.parseEther("-1.2345678000000000912345222"), BigInt("-1234567800000000091"))
    }

    func testParseEtherGweiRounded() throws {
        XCTAssertEqual(BasedUtils.parseEther("0.0000000001", .gwei), BigInt("0"))
        XCTAssertEqual(BasedUtils.parseEther("0.00000000059", .gwei), BigInt("1"))
        XCTAssertEqual(BasedUtils.parseEther("1.00000000059", .gwei), BigInt("1000000001"))
        XCTAssertEqual(BasedUtils.parseEther("69.59000000059", .gwei), BigInt("69590000001"))
        XCTAssertEqual(BasedUtils.parseEther("1.2345678912345222", .gwei), BigInt("1234567891"))
        XCTAssertEqual(BasedUtils.parseEther("-0.0000000001", .gwei), BigInt("0"))
        XCTAssertEqual(BasedUtils.parseEther("-0.00000000059", .gwei), BigInt("-1"))
        XCTAssertEqual(BasedUtils.parseEther("-1.00000000059", .gwei), BigInt("-1000000001"))
        XCTAssertEqual(BasedUtils.parseEther("-69.59000000059", .gwei), BigInt("-69590000001"))
        XCTAssertEqual(BasedUtils.parseEther("-1.2345678912345222", .gwei), BigInt("-1234567891"))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
