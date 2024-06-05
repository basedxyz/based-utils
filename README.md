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
BasedUtils.formatUnits(BigInt("6900000000000"), 10) // 69
```

## License
MIT
