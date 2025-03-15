// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    // TODO: Update your plugin name.
    name: "falconmetrics_flutter",
    platforms: [
        .iOS("12.0"),
    ],
    products: [
        // TODO: Update your library and target names.
        // If the plugin name contains "_", replace with "-" for the library name.
        .library(name: "falconmetrics-flutter", targets: ["falconmetrics_flutter"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "falconmetrics_flutter",
            dependencies: [],
            resources: [
                .process("PrivacyInfo.xcprivacy"),

                // TODO: If you have other resources that need to be bundled with your plugin, refer to
                // the following instructions to add them:
                // https://developer.apple.com/documentation/xcode/bundling-resources-with-a-swift-package
            ]
        )
    ]
)
