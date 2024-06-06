//
//  ParseUnitsTests.swift
//  
//
//  Created by Jann Driessen on 06.06.24.
//

import BigInt
import XCTest

@testable import BasedUtils

final class ParseUnitsTests: XCTestCase {

    func testParseUnits() throws {
        XCTAssertEqual(BasedUtils.parseUnits("69", 1), BigInt("690"))
        XCTAssertEqual(BasedUtils.parseUnits("13", 5), BigInt("1300000"))
        XCTAssertEqual(BasedUtils.parseUnits("420", 10), BigInt("4200000000000"))
        XCTAssertEqual(BasedUtils.parseUnits("20", 9), BigInt("20000000000"))
        XCTAssertEqual(BasedUtils.parseUnits("40", 18), BigInt("40000000000000000000"))
        XCTAssertEqual(BasedUtils.parseUnits("1.2345", 4), BigInt("12345"))
        XCTAssertEqual(BasedUtils.parseUnits("1.0045", 4), BigInt("10045"))
        XCTAssertEqual(BasedUtils.parseUnits("1.2345000", 4), BigInt("12345"))
        XCTAssertEqual(BasedUtils.parseUnits("6942069420.12345678912345", 18), BigInt("6942069420123456789123450000"))
        XCTAssertEqual(BasedUtils.parseUnits("6942069420.00045678912345", 18), BigInt("6942069420000456789123450000"))
        XCTAssertEqual(BasedUtils.parseUnits("6942123123123069420.1234544444678912345", 50), BigInt("694212312312306942012345444446789123450000000000000000000000000000000"))
        XCTAssertEqual(BasedUtils.parseUnits("-69", 1), BigInt("-690"))
        XCTAssertEqual(BasedUtils.parseUnits("1.2345", 4), BigInt("12345"))
        XCTAssertEqual(BasedUtils.parseUnits("-6942069420.12345678912345", 18), BigInt("-6942069420123456789123450000"))
        XCTAssertEqual(BasedUtils.parseUnits("-6942123123123069420.1234544444678912345", 50), BigInt("-694212312312306942012345444446789123450000000000000000000000000000000"))
    }

    func testParseUnitsDecimalsZero() throws {
        XCTAssertEqual(BasedUtils.parseUnits("69.2352112312312451512412341231", 0), BigInt("69"))
        XCTAssertEqual(BasedUtils.parseUnits("69.5952141234124125231523412312", 0), BigInt("70"))
        XCTAssertEqual(BasedUtils.parseUnits("12301000000000000020000", 0), BigInt("12301000000000000020000"))
        XCTAssertEqual(BasedUtils.parseUnits("12301000000000000020000.123", 0), BigInt("12301000000000000020000"))
        XCTAssertEqual(BasedUtils.parseUnits("12301000000000000020000.5", 0), BigInt("12301000000000000020001"))
        XCTAssertEqual(BasedUtils.parseUnits("99999999999999999999999.5", 0), BigInt("100000000000000000000000"))
    }

    func testParseUnitsDecimalsSmallerFractionLength() throws {
        XCTAssertEqual(BasedUtils.parseUnits("69.23521", 0), BigInt("69"))
        XCTAssertEqual(BasedUtils.parseUnits("69.56789", 0), BigInt("70"))
        XCTAssertEqual(BasedUtils.parseUnits("69.23521", 1), BigInt("692"))
        XCTAssertEqual(BasedUtils.parseUnits("69.23521", 2), BigInt("6924"))
        XCTAssertEqual(BasedUtils.parseUnits("69.23221", 2), BigInt("6923"))
        XCTAssertEqual(BasedUtils.parseUnits("69.23621", 3), BigInt("69236"))
        XCTAssertEqual(BasedUtils.parseUnits("999999.99999", 3), BigInt("1000000000"))
        XCTAssertEqual(BasedUtils.parseUnits("699999.99999", 3), BigInt("700000000"))
        XCTAssertEqual(BasedUtils.parseUnits("699999.98999", 3), BigInt("699999990"))
        XCTAssertEqual(BasedUtils.parseUnits("699959.99999", 3), BigInt("699960000"))
        XCTAssertEqual(BasedUtils.parseUnits("699099.99999", 3), BigInt("699100000"))
        XCTAssertEqual(BasedUtils.parseUnits("100000.000999", 3), BigInt("100000001"))
        XCTAssertEqual(BasedUtils.parseUnits("100000.990999", 3), BigInt("100000991"))
        XCTAssertEqual(BasedUtils.parseUnits("69.00221", 3), BigInt("69002"))
        XCTAssertEqual(BasedUtils.parseUnits("1.0536059576998882", 7), BigInt("10536060"))
        XCTAssertEqual(BasedUtils.parseUnits("1.0053059576998882", 7), BigInt("10053060"))
        XCTAssertEqual(BasedUtils.parseUnits("1.0000000900000000", 7), BigInt("10000001"))
        XCTAssertEqual(BasedUtils.parseUnits("1.0000009900000000", 7), BigInt("10000010"))
        XCTAssertEqual(BasedUtils.parseUnits("1.0000099900000000", 7), BigInt("10000100"))
        XCTAssertEqual(BasedUtils.parseUnits("1.0000092900000000", 7), BigInt("10000093"))
        XCTAssertEqual(BasedUtils.parseUnits("1.5536059576998882", 7), BigInt("15536060"))
        XCTAssertEqual(BasedUtils.parseUnits("1.0536059476998882", 7), BigInt("10536059"))
        XCTAssertEqual(BasedUtils.parseUnits("1.4545454545454545", 7), BigInt("14545455"))
        XCTAssertEqual(BasedUtils.parseUnits("1.1234567891234567", 7), BigInt("11234568"))
        XCTAssertEqual(BasedUtils.parseUnits("1.8989898989898989", 7), BigInt("18989899"))
        XCTAssertEqual(BasedUtils.parseUnits("9.9999999999999999", 7), BigInt(
          "100000000"))
        XCTAssertEqual(BasedUtils.parseUnits("0.0536059576998882", 7), BigInt("536060"))
        XCTAssertEqual(BasedUtils.parseUnits("0.0053059576998882", 7), BigInt("53060"))
        XCTAssertEqual(BasedUtils.parseUnits("0.0000000900000000", 7), BigInt("1"))
        XCTAssertEqual(BasedUtils.parseUnits("0.0000009900000000", 7), BigInt("10"))
        XCTAssertEqual(BasedUtils.parseUnits("0.0000099900000000", 7), BigInt("100"))
        XCTAssertEqual(BasedUtils.parseUnits("0.0000092900000000", 7), BigInt("93"))
        XCTAssertEqual(BasedUtils.parseUnits("0.0999999999999999", 7), BigInt("1000000"))
        XCTAssertEqual(BasedUtils.parseUnits("0.0099999999999999", 7), BigInt("100000"))
        XCTAssertEqual(BasedUtils.parseUnits("0.00000000059", 9), BigInt("1"))
        XCTAssertEqual(BasedUtils.parseUnits("0.0000000003", 9), BigInt("0"))
        XCTAssertEqual(BasedUtils.parseUnits("69.00000000000", 9), BigInt("69000000000"))
        XCTAssertEqual(BasedUtils.parseUnits("69.00000000019", 9), BigInt("69000000000"))
        XCTAssertEqual(BasedUtils.parseUnits("69.00000000059", 9), BigInt("69000000001"))
        XCTAssertEqual(BasedUtils.parseUnits("69.59000000059", 9), BigInt("69590000001"))
        XCTAssertEqual(BasedUtils.parseUnits("69.59000002359", 9), BigInt("69590000024"))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
