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

    /// Returns BigInt representation of a given string and decimals.
    ///
    /// Implemented after viem's parseUnits:
    /// https://github.com/wevm/viem/blob/main/src/utils/unit/parseUnits.ts
    ///
    public static func parseUnits(_ value: String, _ decimals: Int) -> BigInt {
        let components = value.components(separatedBy: ".")
        var integer = components[0]
        var fraction = components.count > 1 ? components[1] : "0"

        let negative = integer.starts(with: "-")
        if negative { integer = integer.slice(from: 1) }

        fraction = fraction.removeTrailingZeros()

        if decimals == 0 {
            if round(Double(".\(fraction)") ?? 0) == 1 {
                integer = BigInt.plusOne(integer).description
            }
            fraction = ""
        } else if fraction.count > decimals {
            let left = fraction.slice(from: 0, to: decimals - 1)
            let unit = fraction.slice(from: decimals - 1, to: decimals)
            let right = fraction.slice(from: decimals)

            let rounded = round(Double("\(unit).\(right)") ?? 0)
            if rounded > 9 {
                fraction = "\(BigInt.plusOne(left).description)0".padStart(left.count + 1, with: "0")
            } else {
                fraction = "\(left)\(Int(rounded))"
            }

            if fraction.count > decimals {
                fraction = fraction.slice(from: 1)
                integer = BigInt.plusOne(integer).description
            }

            fraction = fraction.slice(from: 0, to: decimals)
        } else {
            fraction = fraction.padEnd(decimals, with: "0")
        }

        let bn = "\(negative ? "-" : "")\(integer)\(fraction)"
        return BigInt(bn) ?? BigInt(0)
    }

}

public extension BasedUtils.UnitType {

    var decimals: Int {
        if self == .gwei { return 9 }
        return 18
    }

}

// Private

private extension BigInt {

    init(orZero value: String) {
        if let bigIntValue = BigInt(value) {
            self = bigIntValue
        } else {
            self = BigInt(0)
        }
    }

    static func plusOne(_ value: String) -> BigInt {
        return BigInt(orZero: value) + BigInt(1)
    }

}

private extension String {

    func padEnd(_ length: Int, with pad: String = " ") -> String {
        guard self.count < length else { return self }
        let padCount = length - self.count
        let repeatedPad = String(repeating: pad, count: (padCount + pad.count - 1) / pad.count)
        let endIndex = repeatedPad.index(repeatedPad.startIndex, offsetBy: padCount)
        return self + repeatedPad[..<endIndex]
    }

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
