// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EdgesBottomDrawer",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "EdgesBottomDrawer",
            targets: ["EdgesBottomDrawer"]),
    ],
    dependencies: [ ],
    targets: [
        .target(
            name: "EdgesBottomDrawer",
            dependencies: []),
        .testTarget(
            name: "EdgesBottomDrawerTests",
            dependencies: ["EdgesBottomDrawer"]),
    ]
)
