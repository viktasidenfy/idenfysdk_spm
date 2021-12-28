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
            targets: ["idenfycore", "idenfyviews", "idenfyNFCReading", "iDenfySDK"]),
        .library(
            name: "iDenfySDK-Liveness",
            targets: ["idenfycore", "idenfyviews", "IdenfyLiveness", "FaceTecSDK", "idenfyNFCReading", "iDenfySDK"]),
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
            .exact("2.2")
        ),
        .package(
            url: "https://github.com/weichsel/ZIPFoundation.git",
            .exact("0.9.11")
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(name: "idenfycore",
                      url: "https://s3.eu-west-1.amazonaws.com/sdk.builds/ios-sdk/0.0.1/idenfycore.xcframework.zip",
                      checksum: "8bc8cfffb3a78eb6d619e47f607a8e53aa43aa7c089dc56028a92f0b75134e6d"),
        .binaryTarget(name: "idenfyviews",
                      url: "https://s3.eu-west-1.amazonaws.com/sdk.builds/ios-sdk/0.0.1/idenfyviews.xcframework.zip",
                      checksum: "933dd020a6043e7faa9e2b4105490fb594fcc02136211ef310861eeaf102236b"),
        .binaryTarget(name: "idenfyNFCReading",
                      url: "https://s3.eu-west-1.amazonaws.com/sdk.builds/ios-sdk/0.0.1/idenfyNFCReading.xcframework.zip",
                      checksum: "362d8728de518021076acfa75b8314c21698c1237fc6441889a7bb2371b2b1db"),
        .binaryTarget(name: "IdenfyLiveness",
                      url: "https://s3.eu-west-1.amazonaws.com/sdk.builds/ios-sdk/0.0.1/IdenfyLiveness.xcframework.zip",
                      checksum: "206e683cbf4946f8794cafd65b04d05ffa3c07d28fb5a33ea7ea9632af1da86e"),
        .binaryTarget(name: "iDenfySDK",
                      url: "https://s3.eu-west-1.amazonaws.com/sdk.builds/ios-sdk/0.0.1/iDenfySDK.xcframework.zip",
                      checksum: "ccbb4cda69766d980050937f66e4c9317bbafa804015a8eaedd90e8bdca7c39c"),
        .binaryTarget(name: "FaceTecSDK",
                      url: "https://s3.eu-west-1.amazonaws.com/sdk.builds/ios-sdk/0.0.1/FaceTecSDK.xcframework.zip",
                      checksum: "5b2678e5d1b2c2b8f2839c10c412620beb55d0d29464ce2f0656acd13494747d")
    ]
)
