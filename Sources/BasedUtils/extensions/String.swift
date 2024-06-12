//
//  String.swift
//
//
//  Created by Jann Driessen on 12.06.24.
//

import Foundation

public extension String {

    func addHexPrefix() -> String {
        if !self.hasPrefix("0x") {
            return "0x" + self
        }
        return self
    }

    func removeHexPrefix() -> String {
        if self.hasPrefix("0x") {
            let indexStart = self.index(self.startIndex, offsetBy: 2)
            return String(self[indexStart...])
        }
        return self
    }

}
