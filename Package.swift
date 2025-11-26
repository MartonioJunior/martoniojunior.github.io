// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// MARK: - Utilities
public enum UpcomingFeatures: String, CaseIterable {
    case existentialAny
    case fullTypedThrows
    case internalImportsByDefault
    case memberImportVisibility
    case nonescapableTypes
    case nonisolatedNonsendingByDefault
    case inferIsolatedConformances
    case valueGenerics

    var asSetting: SwiftSetting { .enableUpcomingFeature(rawValue.prefix(1).uppercased() + rawValue.dropFirst()) }
}

public extension Array where Element == SwiftSetting {
    static var upcomingFeatures: Self { UpcomingFeatures.allCases.map(\.asSetting) }
}

func dep(local: String) -> Package.Dependency {
    .package(path: local)
}

func dep(url: String, _ version: Range<Version>, local: String = "") -> Package.Dependency {
    if local.isEmpty {
        .package(url: url, version)
    } else {
        dep(local: local)
    }
}

func lib(_ name: String, targets: String...) -> Product {
    .library(name: name, targets: targets)
}

func platformDeps(_ platforms: SupportedPlatform...) -> [SupportedPlatform] {
    platforms
}

func targetDep(name: String, package: String) -> Target.Dependency {
    .product(name: name, package: package)
}

// MARK: Dependencies
let feedKit = targetDep(name: "FeedKit", package: "FeedKit")
let files = targetDep(name: "Files", package: "Files")
let html: Target.Dependency = .product(name: "HTML", package: "swift-html", moduleAliases: ["HTML": "SwiftHTML"])
let markdownReader = targetDep(name: "SagaParsleyMarkdownReader", package: "SagaParsleyMarkdownReader")
let saga = targetDep(name: "Saga", package: "Saga")

let dependencies = [
    dep(url: "https://github.com/coenttb/swift-html", .upToNextMajor(from: "0.11.1")),
    dep(url: "https://github.com/JohnSundell/Files", .upToNextMajor(from: "4.3.0")),
    dep(url: "https://github.com/loopwerk/Saga", .upToNextMajor(from: "2.0.0")),
    dep(url: "https://github.com/loopwerk/SagaParsleyMarkdownReader", .upToNextMajor(from: "1.0.0")),
    dep(url: "https://github.com/nmdias/FeedKit", .upToNextMajor(from: "10.1.3"))
]

public extension Array where Element == Target.Dependency {
    static let ui: [Target.Dependency] = ["CSS", "HTML"]
}

// MARK: Targets
var targets: [Target] = [
    .executableTarget(
        name: "Website",
        dependencies: ["Models", "SagaIntegration"]
    ),
    .target(
        name: "CSS",
        dependencies: [html]
    ),
    .target(
        name: "FileClient",
        dependencies: [files, "HTML"]
    ),
    .target(
        name: "HomeFeature",
        dependencies: ["PageFeature", "PostViewerFeature", "Settings"] + .ui
    ),
    .target(
        name: "HTML",
        dependencies: ["CSS", html]
    ),
    .target(
        name: "Models",
        dependencies: ["HTML"]
    ),
    .target(
        name: "NavigationFeature",
        dependencies: ["Models"] + .ui
    ),
    .target(
        name: "PageFeature",
        dependencies: ["Models", "NavigationFeature"] + .ui
    ),
    .target(
        name: "PostViewerFeature",
        dependencies: ["Models", "TagViewerFeature"] + .ui
    ),
    .target(
        name: "RSS",
        dependencies: [feedKit]
    ),
    .target(
        name: "SagaIntegration",
        dependencies: [
            "Assets", "FileClient", "HTML", "HomeFeature", "Models", "PageFeature",
            "PostViewerFeature", "RSS", "Settings", "TagViewerFeature",
            markdownReader, saga
        ],
        resources: [.process("Resources/")]
    ),
    .target(
        name: "Settings"
    ),
    .target(
        name: "TagViewerFeature",
        dependencies: ["Models"] + .ui
    )
]

let testTargets: [Target] = targets.map {
    .testTarget(name: "\($0.name)Tests", dependencies: [Target.Dependency(stringLiteral: $0.name)] + $0.dependencies)
}

targets.append(
    .target(
        name: "Assets",
        resources: [.process("Resources/")]
    )
)

// MARK: Products
let products: [Product] = [
    .executable(
        name: "Website",
        targets: ["Website"]
    )
]

// MARK: PackageDescription
let package = Package(
    name: "Website",
    platforms: [
        .macOS(.v14)
    ],
    products: products,
    dependencies: dependencies,
    targets: targets,
    swiftLanguageModes: [.v6]
)
