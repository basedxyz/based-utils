//
//  Data.swift
//
//
//  Created by Jann Driessen on 24.06.24.
//

import Foundation

public extension Data {

    /// Returns Data from given hex string.
    ///  - an empty string will return `nil`;
    ///  - an empty hex string is equal to `"0x"` and will return empty `Data` object.
    /// - Parameter hex: bytes represented as string.
    /// - Returns: optional raw bytes.
    static func fromHex(_ hex: String) -> Data? {
        let hex = hex.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard !hex.isEmpty else { return nil }
        guard hex != "0x" else { return Data() }
        let rawHex = hex.removeHexPrefix()
        guard rawHex.count % 2 == 0 else { return nil }
        var data = Data(capacity: rawHex.count / 2)
        var index = rawHex.startIndex
        while index < rawHex.endIndex {
            let nextIndex = rawHex.index(index, offsetBy: 2)
            let byteString = rawHex[index..<nextIndex]
            if let byte = UInt8(byteString, radix: 16) {
                data.append(byte)
            } else {
                return nil
            }
            index = nextIndex
        }
        return data
    }

    func base64UrlEncode() -> String {
        var base64String = self.base64EncodedString()
        // Replace standard Base64 characters to make it URL-safe
        base64String = base64String
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
        return base64String
    }

}
