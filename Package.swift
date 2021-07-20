import PackageDescription
// swift-tools-version:5.3
let package = Package(
    name: "MikadoSDK",
    platforms: [
        .iOS(.v12.1)
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
