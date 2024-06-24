//
//  Data.swift
//
//
//  Created by Jann Driessen on 24.06.24.
//

import Foundation

public extension Data {

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

