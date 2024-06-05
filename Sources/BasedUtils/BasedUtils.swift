import BigInt
import Foundation

public class BasedUtils {

    public enum UnitType {
        case gwei
        case wei
    }

    /// Returns a formatted string representation of given wei.
    ///
    /// Implemented after viem's formatEther:
    /// https://github.com/wevm/viem/blob/main/src/utils/unit/formatEther.ts
    ///
    /// - Parameter wei: wei as BigInt
    /// - Parameter unit: the unit type wei or gwei (default: wei)
    ///
    public static func formatEther(_ wei: BigInt, _ unit: UnitType = .wei) -> String {
        return formatUnits(wei, unit.decimals)
    }

    /// Returns a formatted string representation of a BigInt according to the
    /// given decimals.
    ///
    /// Implemented after viem's formatUnits:
    /// https://github.com/wevm/viem/blob/main/src/utils/unit/formatUnits.ts
    ///
    public static func formatUnits(_ value: BigInt, _ decimals: Int) -> String {
        var display = value.description

        let negative = display.starts(with: "-")
        if negative { display = display.slice(from: 1) }

        display = display.padStart(decimals, with: "0")

        let integer = display.slice(from: 0, to: display.count - decimals)
        var fraction = display.slice(from: display.count - decimals)
        fraction = fraction.removeTrailingZeros().removeDecimalPoint()

        return "\(negative ? "-" : "")\(integer.isEmpty ? "0" : integer)\(fraction.isEmpty ? "" : ".\(fraction)")"
    }

    /// Simplified check whether a given string is an address.
    /// Note that this function does not test the checksum!
    public static func isAddress(_ address: String) -> Bool {
        // Check for hex prefix and length of 20 bytes (40 characters in hex)
        return address.hasPrefix("0x") && address.count == 42
    }

    /// Checks whether given addressess are the same.
    ///
    /// - Returns: true for same address; false if the given addresses differ
    /// or either one is not a valid address
    public static func isSameAddress(_ address1: String, _ address2: String) -> Bool {
        guard isAddress(address1), isAddress(address2) else { return false }
        return address1.lowercased() == address2.lowercased()
    }

    /// Shortens given address to common format e.g. 0xd8dB...6042
    ///
    /// - Returns: short address or nil for invalid address or invalid
    /// prefix/suffix count
    public static func shortenAddress(_ address: String, prefix: Int = 4, suffix: Int = 4) -> String? {
        guard isAddress(address) else { return nil }
        guard prefix > 0, suffix > 0 else { return nil }
        // prefix + 2 for hex prefix
        return "\(String(address.prefix(prefix + 2)))...\(String(address.suffix(suffix)))"
    }

}

public extension BasedUtils.UnitType {

    var decimals: Int {
        if self == .gwei { return 9 }
        return 18
    }

}

// Private

private extension String {

    func padStart(_ length: Int, with pad: Character = " ") -> String {
        let padCount = length - self.count
        guard padCount > 0 else { return self }
        return String(repeating: pad, count: padCount) + self
    }

    func removeTrailingZeros() -> String {
        let regex = try! NSRegularExpression(pattern: "(0+)$")
        let range = NSRange(location: 0, length: self.utf16.count)
        let trimmedString = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: "")
        return trimmedString
    }

    func removeDecimalPoint() -> String {
        var remove = self
        if self.hasSuffix(".") {
            remove.removeLast()
        }
        return remove
    }

    func slice(from: Int, to: Int? = nil) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: from)
        let endIndex = to != nil ? self.index(self.startIndex, offsetBy: to!) : self.endIndex
        return String(self[startIndex..<endIndex])
    }

}
