//
//  BasedUtils+Address.swift
//
//
//  Created by Jann Driessen on 06.06.24.
//

import Foundation

public extension BasedUtils {

    /// Simplified check whether a given string is an address.
    /// Note that this function does not test the checksum!
    static func isAddress(_ address: String) -> Bool {
        // Check for hex prefix and length of 20 bytes (40 characters in hex)
        return address.hasPrefix("0x") && address.count == 42
    }

    /// Checks whether given addressess are the same.
    ///
    /// - Returns: true for same address; false if the given addresses differ
    /// or either one is not a valid address
    static func isSameAddress(_ address1: String, _ address2: String) -> Bool {
        guard isAddress(address1), isAddress(address2) else { return false }
        return address1.lowercased() == address2.lowercased()
    }

    /// Shortens given address to common format e.g. 0xd8dB...6042
    ///
    /// - Returns: short address or nil for invalid address or invalid
    /// prefix/suffix count
    static func shortenAddress(_ address: String, prefix: Int = 4, suffix: Int = 4) -> String? {
        guard isAddress(address) else { return nil }
        guard prefix > 0, suffix > 0 else { return nil }
        // prefix + 2 for hex prefix
        return "\(String(address.prefix(prefix + 2)))...\(String(address.suffix(suffix)))"
    }

}
