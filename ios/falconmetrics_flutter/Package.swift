// swift-tools-version:6.1
import PackageDescription

let package = Package(
    name: "falconmetrics_flutter",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "falconmetrics-flutter", targets: ["falconmetrics_flutter"])
    ],
    dependencies: [
        // FalconMetrics iOS SDK (hosted via Git)
        .package(
            url: "https://github.com/falconmetrics/falconmetrics-ios-spm.git",
            from: "0.1.3"
        ),
        // Swift Protobuf
        .package(
            url: "https://github.com/apple/swift-protobuf.git",
            from: "1.27.0"
        )
    ],
    targets: [
        .target(
            name: "falconmetrics_flutter",
            dependencies: [
                .product(name: "FalconMetrics", package: "falconmetrics-ios-spm"),
                .product(name: "SwiftProtobuf", package: "swift-protobuf")
            ]
        )
    ]
)
