//
//  FormatUnitsTests.swift
//
//
//  Created by Jann Driessen on 05.06.24.
//

import BigInt
import XCTest

@testable import BasedUtils

final class FormatUnitsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFormatUnits() throws {
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("69"), 0), "69")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("69"), 5), "0.00069")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("690"), 1), "69")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("1300000"), 5), "13")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("4200000000000"), 10), "420")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("20000000000"), 9), "20")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("40000000000000000000"), 18), "40")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("10000000000000"), 18), "0.00001")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("12345"), 4), "1.2345")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("12345"), 4), "1.2345")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("6942069420123456789123450000"), 18), "6942069420.12345678912345")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("694212312312306942012345444446789123450000000000000000000000000000000"), 50), "6942123123123069420.1234544444678912345")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("-690"), 1), "-69")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("-1300000"), 5), "-13")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("-4200000000000"), 10), "-420")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("-20000000000"), 9), "-20")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("-40000000000000000000"), 18), "-40")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("-12345"), 4), "-1.2345")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("-12345"), 4), "-1.2345")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("-6942069420123456789123450000"), 18), "-6942069420.12345678912345")
        XCTAssertEqual(BasedUtils.formatUnits(BigInt("-694212312312306942012345444446789123450000000000000000000000000000000"), 50), "-6942123123123069420.1234544444678912345")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
