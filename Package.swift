// swift-tools-version:5.4.0
import PackageDescription

let package = Package(
    name: "MikadoSDK",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "MikadoSDK", 
            targets: ["MikadoSDK"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.4.0")),
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", .upToNextMajor(from: "1.9.0")),

    ],
    targets: [
        .binaryTarget(
            name: "MikadoSDK",
            path: "MikadoSDK.xcframework")
    ])
