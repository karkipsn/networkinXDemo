// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkingXDemo",
    platforms: [.iOS(.v11)],
    products: [
        .library(name: "NetworkingXDemo-Domain",
                 targets: ["NetworkingXDemo-Domain"]),
            
        .library(name: "NetworkingXDemo-Platform",
                 targets: ["NetworkingXDemo-Platform"]),
    ],

    dependencies: [
        .package(url: "https://github.com/prashantLalShrestha/NetworkingX.git", from: "1.2.1"),
        .package(url: "https://github.com/prashantLalShrestha/DataStoreX.git", from: "1.1.0"),

    ],
    targets: [
        .target(name: "NetworkingXDemo-Domain",
                path: "Sources/Domain"),
            
        .target(name: "NetworkingXDemo-Platform",
                    dependencies: ["NetworkingXDemo-Domain", "NetworkingX", "DataStoreX"],
                path: "Sources/Platform/NetworkingXDemo"),
    ],
    swiftLanguageVersions: [SwiftVersion.v5]

)
