// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iDenfySDK",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "iDenfySDK",
            targets: ["idenfycore", "idenfyviewsWrapper", "idenfyNFCReading", "iDenfySDKWrapper"]),
        .library(
            name: "iDenfySDK-Liveness",
            targets: ["idenfycore", "idenfyviewsWrapper", "idenfyLivenessWrapper", "FaceTecSDK", "idenfyNFCReading", "iDenfySDKWrapper"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(
            url: "https://github.com/getsentry/sentry-cocoa.git",
            .exact("7.5.2")
        ),
        .package(
            url: "https://github.com/airbnb/lottie-ios.git",
            .exact("3.2.2")
        ),
        .package(
            url: "https://github.com/JonasGessner/JGProgressHUD.git",
            .exact("2.2.0")
        ),
        .package(
            url: "https://github.com/weichsel/ZIPFoundation.git",
            .exact("0.9.11")
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "idenfyviewsWrapper",
            dependencies: [
                .product(name: "lottie-ios", package: "lottie-ios"),
                .target(name: "idenfyviews")
            ],
            path: "Sources/idenfyviewsWrapper",
            publicHeadersPath: ""
        ),
        .target(
            name: "idenfyLivenessWrapper",
            dependencies: [
                .product(name: "lottie-ios", package: "lottie-ios"),
                .target(name: "IdenfyLiveness")
            ],
            path: "Sources/idenfyLivenessWrapper",
            publicHeadersPath: ""
        ),
        .target(
            name: "iDenfySDKWrapper",
            dependencies: [
                .product(name: "lottie-ios", package: "lottie-ios"),
                .product(name: "JGProgressHUD", package: "JGProgressHUD"),
                .product(name: "ZIPFoundation", package: "ZIPFoundation"),
                .product(name: "sentry-cocoa", package: "sentry-cocoa"),
                .target(name: "iDenfySDK")
            ],
            path: "Sources/iDenfySDKWrapper",
            publicHeadersPath: ""
        ),
        .binaryTarget(name: "idenfycore",
                      url: "https://s3.eu-west-1.amazonaws.com/sdk.builds/ios-sdk/0.0.1/idenfycore.xcframework.zip",
                      checksum: "15efdc7e2da8500a423c2523242dcc95f117de60b20473c022fbdc9ed5160884"),
        .binaryTarget(name: "idenfyviews",
                      url: "https://s3.eu-west-1.amazonaws.com/sdk.builds/ios-sdk/0.0.1/idenfyviews.xcframework.zip",
                      checksum: "ae2b7eea5e6a33a50fae2f4e86ebdb97a7929e4de2bccceedfe1307a75dad5ad"),
        .binaryTarget(name: "idenfyNFCReading",
                      url: "https://s3.eu-west-1.amazonaws.com/sdk.builds/ios-sdk/0.0.1/idenfyNFCReading.xcframework.zip",
                      checksum: "813d5a64489eedb9dc4ceb5f46892b8bd5eb75eb60d4499e3e2dd230c845e0fb"),
        .binaryTarget(name: "IdenfyLiveness",
                      url: "https://s3.eu-west-1.amazonaws.com/sdk.builds/ios-sdk/0.0.1/IdenfyLiveness.xcframework.zip",
                      checksum: "82110a4d30f194b23880fd12a870357e761865af7b6bccfa5928e07f4cff0b03"),
        .binaryTarget(name: "iDenfySDK",
                      url: "https://s3.eu-west-1.amazonaws.com/sdk.builds/ios-sdk/0.0.1/iDenfySDK.xcframework.zip",
                      checksum: "8335ea245498888401833ca52676b0ac8e698dc7e6128475fa6438349d729139"),
        .binaryTarget(name: "FaceTecSDK",
                      url: "https://s3.eu-west-1.amazonaws.com/sdk.builds/ios-sdk/0.0.1/FaceTecSDK.xcframework.zip",
                      checksum: "720ba8607f4300d48470240aae89d1d73281a9f99850cb239779d732da1a6469")
    ]
)
