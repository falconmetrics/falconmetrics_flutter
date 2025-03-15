// swift-tools-version: 5.9.0
import PackageDescription

let package = Package(
    name: "falconmetrics_flutter",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "falconmetrics-flutter", targets: ["falconmetrics_flutter"])
    ],
    dependencies: [
        .package(id: "falconmetrics.falconmetrics_ios", from: "0.0.7")
    ],
    targets: [
        .target(
        name: "falconmetrics_flutter",
        dependencies: [.product(name: "falconmetrics_ios", package: "falconmetrics.falconmetrics_ios")]
    )
    ]
)