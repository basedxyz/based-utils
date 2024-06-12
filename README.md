# BasedUtils

A small collection of based utils for the day-to-day use.

Terminology will stay close to ethers and viem.

WIP 🚧👷🏗️

## Features

formatEther

```swift
BasedUtils.formatEther(BigInt("6900000000000000000000000000")) // "6900000000"
BasedUtils.formatEther(BigInt("69000000000000"), .gwei) // "69000"
```

formatUnits

```swift
BasedUtils.formatUnits(BigInt("6900000000000"), 10) // "69"
```

parseEther

```swift
BasedUtils.parseEther("1") // BigInt("1000000000000000000")
BasedUtils.parseEther("1", .gwei) // BigInt("1000000000")
```

parseUnits

```swift
BasedUtils.parseUnits("40", 18) // BigInt("40000000000000000000")
```

isAddress

```swift
BasedUtils.isAddress("0x220866B1A2219f40e72f5c628B65D54268cA3A9D") // true
BasedUtils.isAddress("220866B1A2219f40e72f5c628B65D54268cA3A9D") // false
BasedUtils.isAddress("0x220866B1A2219f40e72f5c628B65D54268cA3A9") // false
```

isSameAddress

```swift
let address1 = "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045"
let address2 = "0x220866B1A2219f40e72f5c628B65D54268cA3A9D"
BasedUtils.isSameAddress(address1, address1) // true
BasedUtils.isSameAddress(address1, address2) // false
```

shortenAddress

```swift
let address1 = "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045"
BasedUtils.shortenAddress(address1) // "0xd8dA...6045"
```

### Extensions

String
```swift
let address = "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045"
let hash = "d8dA6B"
hash.addHexPrefix() // "0xd8dA6B"
address.addHexPrefix() // "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045" (only adds if it doesn't exist)
address.removeHexPrefix() // "d8dA6BF26964aF9D7eEd9e03E53415D37aA96045"
```

## Dependencies

- [BigInt](https://github.com/attaswift/BigInt)

## License

[MIT](./LICENSE)
