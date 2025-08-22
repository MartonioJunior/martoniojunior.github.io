// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let publish: Target.Dependency = .product(name: "Publish", package: "publish")
let plot: Target.Dependency = .product(name: "Plot", package: "plot")

// MARK: Dependencies
let dependencies: [Package.Dependency] = [
    .package(url: "https://github.com/johnsundell/publish", from: "0.1.0"),
    .package(url: "https://github.com/johnsundell/plot", from: "0.14.0")
    // .package(url: "https://github.com/swiftwasm/carton", from: "1.0.0"),
    // .package(url: "https://github.com/swiftwasm/JavaScriptKit", exact: "0.19.2")
]

public extension Array where Element == Target.Dependency {
    static let ui: [Target.Dependency] = ["CSS", "HTML"]
}

// MARK: Targets
let targets: [Target] = [
    .executableTarget(
        name: "Website",
        dependencies: ["PublishIntegration", publish]
    ),
    .target(
        name: "AreasFeature",
        dependencies: .ui
    ),
    .target(
        name: "CSS",
        dependencies: [plot]
    ),
    .target(
        name: "HTML",
        dependencies: ["CSS", plot]
    ),
    .target(
        name: "HomeFeature",
        dependencies: ["PostsFeature"] + .ui
    ),
    .target(
        name: "PageFeature",
        dependencies: ["AreasFeature"] + .ui
    ),
    .target(
        name: "PostsFeature",
        dependencies: ["TagsFeature"] + .ui
    ),
    .target(
        name: "PublishIntegration",
        dependencies: ["HomeFeature", "PageFeature", "PostsFeature", "TagsFeature", "Settings", publish]
    ),
    .target(
        name: "Settings"
    ),
    .target(
        name: "TagsFeature",
        dependencies: .ui
    )
]

let testTargets: [Target] = targets.map {
    .testTarget(name: "\($0.name)Tests", dependencies: [Target.Dependency(stringLiteral: $0.name)] + $0.dependencies)
}

// MARK: PackageDescription
let package = Package(
    name: "Website",
    platforms: [
        .macOS(.v12)
    ],
    products: [],
    dependencies: dependencies,
    targets: targets,
    swiftLanguageModes: [.v6]
)
