// swift-tools-version: 6.3.3

import PackageDescription

let package = Package(
    name: "swift-order-finite-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(
            name: "Order Finite Primitives",
            targets: ["Order Finite Primitives"]
        ),
        .library(
            name: "Order Finite Primitives Test Support",
            targets: ["Order Finite Primitives Test Support"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-primitives/swift-finite-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-order-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-cardinal-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-ordinal-primitives.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Order Finite Primitives",
            dependencies: [
                .product(name: "Finite Enumerable Primitives", package: "swift-finite-primitives"),
                .product(name: "Order Monotonicity Primitives", package: "swift-order-primitives"),
                .product(name: "Cardinal Primitives", package: "swift-cardinal-primitives"),
                .product(name: "Ordinal Primitives", package: "swift-ordinal-primitives"),
            ]
        ),
        .target(
            name: "Order Finite Primitives Test Support",
            dependencies: [
                "Order Finite Primitives",
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Order Finite Primitives Tests",
            dependencies: [
                "Order Finite Primitives",
                "Order Finite Primitives Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
