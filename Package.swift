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
let customDump = targetDep(name: "CustomDump", package: "swift-custom-dump")
let elementary = targetDep(name: "Elementary", package: "Elementary")
let elementaryFlow = targetDep(name: "ElementaryFlow", package: "elementary-flow")
let feedKit = targetDep(name: "FeedKit", package: "FeedKit")
let files = targetDep(name: "Files", package: "Files")
let markdown = targetDep(name: "Markdown", package: "swift-markdown")
let parsley = targetDep(name: "Parsley", package: "Parsley")
let saga = targetDep(name: "Saga", package: "Saga")

let dependencies = [
    .package(url: "https://github.com/pointfreeco/swift-custom-dump", .upToNextMajor(from: "1.7.3")),
    dep(url: "https://github.com/elementary-swift/elementary", .upToNextMajor(from: "0.7.1")),
    .package(url: "https://github.com/elementary-swift/elementary-flow", .upToNextMajor(from: "0.1.0")),
    dep(url: "https://github.com/JohnSundell/Files", .upToNextMajor(from: "4.3.0")),
    dep(url: "https://github.com/loopwerk/Saga", .upToNextMajor(from: "3.3.2")),
    dep(url: "https://github.com/loopwerk/Parsley", .upToNextMajor(from: "1.2.0")),
    dep(url: "https://github.com/nmdias/FeedKit", .upToNextMajor(from: "10.1.3")),
    dep(url: "https://github.com/swiftlang/swift-markdown", .upToNextMajor(from: "0.7.0"))
]

public extension Array where Element == Target.Dependency {
    static let ui: [Target.Dependency] = ["Styleguide", elementary, elementaryFlow]
}

// MARK: Targets
var targets: [Target] = [
    .executableTarget(
        name: "Website",
        dependencies: ["Models", "StaticSiteGenerator"]
    ),
    .target(
        name: "FileClient",
        dependencies: [files, "Styleguide"]
    ),
    .target(
        name: "HomeFeature",
        dependencies: ["Models", "NavigationFeature", "PageFeature", "PostViewerFeature", "Settings"] + .ui
    ),
    .target(
        name: "MarkdownHTML",
        dependencies: [markdown, parsley, elementary]
    ),
    .target(
        name: "Models",
        dependencies: [elementary]
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
        name: "Router",
        dependencies: ["Models"]
    ),
    .target(
        name: "RSS",
        dependencies: [feedKit]
    ),
    .target(
        name: "Sitemap"
    ),
    .target(
        name: "StaticSiteGenerator",
        dependencies: [
            "Assets", "FileClient", "Styleguide", "HomeFeature", "MarkdownHTML", "Models",
            "PageFeature", "PostViewerFeature", "RSS", "Settings", "TagViewerFeature", saga
        ],
        resources: [.process("Resources/")]
    ),
    .target(
        name: "Styleguide",
        dependencies: [elementary]
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
    .testTarget(
        name: "\($0.name)Tests",
        dependencies: [
            Target.Dependency(stringLiteral: $0.name),
            customDump
        ] + $0.dependencies
    )
}

targets.append(
    .target(
        name: "Assets",
        resources: [.process("Resources/")]
    )
)

targets.append(
    .target(
        name: "WebsitePlaygrounds",
        dependencies: ["MarkdownHTML"]
    )
)

// MARK: Products
let products: [Product] = [
    .executable(
        name: "Website",
        targets: ["Website"]
    )
] + targets.filter {
    $0.name != "Website"
}.map {
    .library(name: $0.name, targets: [$0.name])
}

// MARK: PackageDescription
let package = Package(
    name: "Website",
    platforms: [
        .macOS(.v26)
    ],
    products: products,
    dependencies: dependencies,
    targets: targets + testTargets,
    swiftLanguageModes: [.v6]
)
