//
//  AddressTests.swift
//  
//
//  Created by Jann Driessen on 05.06.24.
//

import BigInt
import XCTest

@testable import BasedUtils

final class AddressTests: XCTestCase {

    func testIsAddress() throws {
        let address = "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045"
        XCTAssertTrue(BasedUtils.isAddress(address))
        XCTAssertFalse(BasedUtils.isAddress("0x220866B1A2219f40e72f5c628B65D54268cA3A9"))
        XCTAssertFalse(BasedUtils.isAddress("0x220866B1A2219f40e72f5c628B65D54268cA3A"))
        XCTAssertFalse(BasedUtils.isAddress("220866B1A2219f40e72f5c628B65D54268cA3A9D"))
    }

    func testIsSameAddress() throws {
        let address1 = "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045"
        let address2 = "0x220866B1A2219f40e72f5c628B65D54268cA3A9D"
        XCTAssertTrue(BasedUtils.isSameAddress(address1, address1))
        XCTAssertTrue(BasedUtils.isSameAddress(address1, address1.lowercased()))
        XCTAssertTrue(BasedUtils.isSameAddress(address1.lowercased(), address1.lowercased()))
        XCTAssertFalse(BasedUtils.isSameAddress(address1, address2))
        XCTAssertFalse(BasedUtils.isSameAddress("d8dA6BF26964aF9D7eEd9e03E53415D37aA96045", "d8dA6BF26964aF9D7eEd9e03E53415D37aA96045"))
        XCTAssertFalse(BasedUtils.isSameAddress("d8dA6BF26964aF9D7eEd9e03E53415D37aA96045", address1))
        XCTAssertFalse(BasedUtils.isSameAddress(address1, "d8dA6BF26964aF9D7eEd9e03E53415D37aA96045"))
    }

    func testShortenAddress() throws {
        let address = "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045"
        XCTAssertEqual(BasedUtils.shortenAddress(address), "0xd8dA...6045")
        XCTAssertEqual(BasedUtils.shortenAddress(address, prefix: 5), "0xd8dA6...6045")
        XCTAssertEqual(BasedUtils.shortenAddress(address, suffix: 5), "0xd8dA...96045")
        XCTAssertEqual(BasedUtils.shortenAddress(address, prefix: 5, suffix: 5), "0xd8dA6...96045")
        XCTAssertNil(BasedUtils.shortenAddress(address, prefix: 0, suffix: 5))
        XCTAssertNil(BasedUtils.shortenAddress(address, prefix: 5, suffix: 0))
        XCTAssertNil(BasedUtils.shortenAddress(address, prefix: 0, suffix: 0))
        XCTAssertNil(BasedUtils.shortenAddress("d8dA6BF26964aF9D7eEd9e03E53415D37aA96045"))
    }

}
