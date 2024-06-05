import BigInt
import Foundation

public class BasedUtils {

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
