//
//  Katex.swift
//  Website
//
//  Created by Martônio Júnior on 15/10/2025.
//

public typealias KaTeX = Katex

/// Definition for KaTeX's auto-render plugin
/// Sources:
///   - https://katex.org/docs/api
///   - https://katex.org/docs/autorender
public struct Katex {
    var options: Options = .init()

    // MARK: Initializers
    public init() {}
}

// MARK: Self.Delimiter
public extension Katex {
    struct Delimiter {
        var left: String
        var right: String
        var display: Bool
    }
}

public extension Katex.Delimiter {
    static var singleDelimiter: Self {
        .init(left: "$", right: "$", display: false)
    }

    static var doubleDelimiter: Self {
        .init(left: "$$", right: "$$", display: true)
    }
}

extension Katex.Delimiter: Codable {}

public extension Array where Element == Katex.Delimiter {
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
    struct Options {
        var delimiters: [Delimiter] = .defaultDelimiters + [.singleDelimiter]
    }
}

extension Katex.Options: Codable {}

// MARK: Self: JSLibrary
extension Katex: JSLibrary {
    public var body: some HTMLComponent {
        link(
            crossorigin: .anonymous,
            href: "https://cdn.jsdelivr.net/npm/katex@0.16.23/dist/katex.min.css",
            integrity: "sha384-//SZkxyB7axjCAopkAL1E1rve+ZSPKapD89Lo/lLhcsXR+zOYl5z6zJZEFXil+q0",
            rel: .stylesheet
        )
        script(
            src: "https://cdn.jsdelivr.net/npm/katex@0.16.23/dist/katex.min.js",
            defer: true,
            integrity: "sha384-cpAIxua0Xbyc+XrpHQpCtJzGSZ6U2kS/FeyoKjnS+BgAYNV6uVUetVs/LC9+l3rs",
            crossorigin: .anonymous
        )
        script(
            src: "https://cdn.jsdelivr.net/npm/katex@0.16.23/dist/contrib/auto-render.min.js",
            defer: true,
            integrity: "sha384-hCXGrW6PitJEwbkoStFjeJxv+fSOOQKOPbJxSfM6G5sWZjAyWhXiTIIAmQqnlLlh",
            crossorigin: .anonymous
        ).onload(js: autoRenderScript)
    }

    var autoRenderScript: String {
        var source =  "renderMathInElement(document.body"

        if let argument = try? options.encodeToJS() {
            source += ", "+argument
        }

        source += ");"
        return source
    }
}
