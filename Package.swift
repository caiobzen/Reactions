// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Reactions",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "Reactions",
            targets: ["Reactions"]),
    ],
    targets: [
        .target(
            name: "Reactions",
            dependencies: []),
        .testTarget(
            name: "ReactionsTests",
            dependencies: ["Reactions"]),
    ]
)
