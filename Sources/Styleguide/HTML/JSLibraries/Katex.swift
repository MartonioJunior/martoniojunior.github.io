//
//  Katex.swift
//  Website
//
//  Created by Martônio Júnior on 15/10/2025.
//

import Elementary

/// Definition for KaTeX's auto-render plugin.
public typealias KaTeX = Katex
/// Definition for KaTeX's auto-render plugin.
/// 
/// Used to render math expressions.
/// Sources:
///   - https://katex.org/docs/api
///   - https://katex.org/docs/autorender
public struct Katex {
    /// Settings for the module.
    var options: Options = .init()
    // MARK: Initializers
    /// Instances KaTeX for use.
    public init() {}
}

// MARK: Self.Delimiter
public extension Katex {
    /// Delimiter for an inline math expression.
    struct Delimiter {
        /// Defines the left symbol expression for a math expression.
        var left: String
        /// Defines the right symbol expression for a math expression.
        var right: String
        var display: Bool
    }
}

public extension Katex.Delimiter {
    /// Basic "$" delimiter for an inline math expression.
    static var singleDelimiter: Self {
        .init(left: "$", right: "$", display: false)
    }
    /// Basic "$$" delimiter for an inline math expression.
    static var doubleDelimiter: Self {
        .init(left: "$$", right: "$$", display: true)
    }
}

extension Katex.Delimiter: Codable {}

public extension Array where Element == Katex.Delimiter {
    /// Default set of delimiters based on KaTeX.
    static var defaultDelimiters: Self {
        [
            .doubleDelimiter,
            Katex.Delimiter(left: "\\(", right: "\\)", display: true),
            Katex.Delimiter(left: "\\begin{equation}", right: "\\end{equation}", display: true),
            Katex.Delimiter(left: "\\begin{align}", right: "\\end{align}", display: true),
            Katex.Delimiter(left: "\\begin{alignat}", right: "\\end{alignat}", display: true),
            Katex.Delimiter(left: "\\begin{gather}", right: "\\end{gather}", display: true),
            Katex.Delimiter(left: "\\begin{CD}", right: "\\end{CD}", display: true),
            Katex.Delimiter(left: "\\[", right: "\\]", display: true)
        ]
    }
}

// MARK: Self.Options
public extension Katex {
    /// List of options available for the KaTeX library.
    struct Options {
        /// Delimiters detected by the library.
        var delimiters: [Delimiter] = .defaultDelimiters + [.singleDelimiter]
    }
}

extension Katex.Options: Codable {}

// MARK: Self: JSLibrary
extension Katex: JSLibrary {
    // swiftlint:disable:next missing_docs
    public var body: some HTML {
        link(
            .crossorigin(.anonymous),
            .href("https://cdn.jsdelivr.net/npm/katex@0.16.23/dist/katex.min.css"),
            .integrity("sha384-//SZkxyB7axjCAopkAL1E1rve+ZSPKapD89Lo/lLhcsXR+zOYl5z6zJZEFXil+q0"),
            .rel(.stylesheet)
        )
        script(
            .src("https://cdn.jsdelivr.net/npm/katex@0.16.23/dist/katex.min.js"),
            .defer,
            .integrity("sha384-cpAIxua0Xbyc+XrpHQpCtJzGSZ6U2kS/FeyoKjnS+BgAYNV6uVUetVs/LC9+l3rs"),
            .crossorigin(.anonymous)
        ) {}
        script(
            .src("https://cdn.jsdelivr.net/npm/katex@0.16.23/dist/contrib/auto-render.min.js"),
            .defer,
            .integrity("sha384-hCXGrW6PitJEwbkoStFjeJxv+fSOOQKOPbJxSfM6G5sWZjAyWhXiTIIAmQqnlLlh"),
            .crossorigin(.anonymous),
            .onload(js: autoRenderScript)
        ) {}
    }
    /// Defines the structure required to automatically render the math element.
    var autoRenderScript: String {
        var source = "renderMathInElement(document.body"

        if let argument = try? options.encodeToJson() {
            source += ", " + argument
        }

        source += ");"
        return source
    }
}
