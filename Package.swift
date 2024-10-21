// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "CredentialIssuer",
    platforms: [
       .macOS(.v13)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.99.3"),
        .package(url: "https://github.com/vapor/jwt.git", from: "5.0.0"),
        // 🔵 Non-blocking, event-driven networking for Swift. Used for custom executors
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.65.0")
    ],
    targets: [
        .executableTarget(
            name: "Issuer",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "JWT", package: "jwt"),
                .product(name: "NIOCore", package: "swift-nio"),
                .product(name: "NIOPosix", package: "swift-nio")
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "IssuerTests",
            dependencies: [
                .target(name: "Issuer"),
                .product(name: "XCTVapor", package: "vapor")
            ],
            swiftSettings: swiftSettings
        ),

        .target(name: "Authorization")
    ]
)

var swiftSettings: [SwiftSetting] { [
    .enableUpcomingFeature("DisableOutwardActorInference"),
    .enableExperimentalFeature("StrictConcurrency")
] }
