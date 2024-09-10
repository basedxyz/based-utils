//
//  String.swift
//
//
//  Created by Jann Driessen on 12.06.24.
//

import Foundation

public extension String {

    func addHexPrefix() -> String {
        if !hasHexPrefix {
            return "0x" + self
        }
        return self
    }

    var hasHexPrefix: Bool {
        return self.hasPrefix("0x")
    }

    func isHex() -> Bool {
        return hasHexPrefix
    }

    func removeHexPrefix() -> String {
        if hasHexPrefix {
            let indexStart = self.index(self.startIndex, offsetBy: 2)
            return String(self[indexStart...])
        }
        return self
    }

}
