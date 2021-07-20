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
            // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        .binaryTarget(
            name: "MikadoSDK", 
            path: "MikadoSDK.xcframework")
    ])
