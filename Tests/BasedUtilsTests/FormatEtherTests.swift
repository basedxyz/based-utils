//
//  FormatEtherTests.swift
//
//
//  Created by Jann Driessen on 05.06.24.
//

import BigInt
import XCTest

@testable import BasedUtils

final class FormatEtherTests: XCTestCase {

    func testFormatEther() throws {
        XCTAssertEqual(BasedUtils.formatEther(BigInt("6942069420123456789123450000")), "6942069420.12345678912345")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("6942069420000000000000000000")), "6942069420")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("1000000000000000000000000")), "1000000")
        XCTAssertEqual(
            BasedUtils.formatEther(BigInt("1000000000000000000000000")),
            BasedUtils.formatEther(BigInt("1000000000000000000000000"), .wei)
        )
        XCTAssertEqual(BasedUtils.formatEther(BigInt("100000000000000000000000")), "100000")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("10000000000000000000000")), "10000")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("1000000000000000000000")), "1000")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("100000000000000000000")), "100")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("10000000000000000000")), "10")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("1000000000000000000")), "1")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("500000000000000000")), "0.5")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("100000000000000000")), "0.1")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("10000000000000000")), "0.01")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("1000000000000000")), "0.001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("100000000000000")), "0.0001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("10000000000000")), "0.00001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("1000000000000")), "0.000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("100000000000")), "0.0000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("10000000000")), "0.00000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("1000000000")), "0.000000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("100000000")), "0.0000000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("10000000")), "0.00000000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("1000000")), "0.000000000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("100000")), "0.0000000000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("10000")), "0.00000000000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("1000")), "0.000000000000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("100")), "0.0000000000000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("10")), "0.00000000000000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("1")), "0.000000000000000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("0")), "0")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-6942069420123456789123450000")), "-6942069420.12345678912345")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-6942069420000000000000000000")), "-6942069420")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-1000000000000000000")), "-1")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-500000000000000000")), "-0.5")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-100000000000000000")), "-0.1")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-10000000")), "-0.00000000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-100000")), "-0.0000000000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-10000")), "-0.00000000000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-1000")), "-0.000000000000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-100")), "-0.0000000000000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-10")), "-0.00000000000000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-1")), "-0.000000000000000001")
    }

    func testFormatEtherGwei() throws {
        XCTAssertEqual(BasedUtils.formatEther(BigInt("69420123456700"), .gwei), "69420.1234567")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("69420000000000"), .gwei), "69420")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("1000000000"), .gwei), "1")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("500000000"), .gwei), "0.5")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("100000000"), .gwei), "0.1")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("10000000"), .gwei), "0.01")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("1000000"), .gwei), "0.001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("100000"), .gwei), "0.0001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("10000"), .gwei), "0.00001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("1000"), .gwei), "0.000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("100"), .gwei), "0.0000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("10"), .gwei), "0.00000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("1"), .gwei), "0.000000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("0"), .gwei), "0")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-69420123456700"), .gwei), "-69420.1234567")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-69420000000000"), .gwei), "-69420")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-1000000000"), .gwei), "-1")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-500000000"), .gwei), "-0.5")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-100000000"), .gwei), "-0.1")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-10000000"), .gwei), "-0.01")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-1000000"), .gwei), "-0.001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-100000"), .gwei), "-0.0001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-10000"), .gwei), "-0.00001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-1000"), .gwei), "-0.000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-100"), .gwei), "-0.0000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-10"), .gwei), "-0.00000001")
        XCTAssertEqual(BasedUtils.formatEther(BigInt("-1"), .gwei), "-0.000000001")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
