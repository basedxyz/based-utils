// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BasedUtils",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "BasedUtils",
            targets: ["BasedUtils"]),
    ],
    dependencies: [
        .package(url: "https://github.com/attaswift/BigInt", from: "5.3.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "BasedUtils",
            dependencies: ["BigInt"]),
        .testTarget(
            name: "BasedUtilsTests",
            dependencies: ["BasedUtils"]),
    ]
)
