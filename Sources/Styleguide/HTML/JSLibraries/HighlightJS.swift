//
//  HighlightJS.swift
//  Website
//
//  Created by Martônio Júnior on 15/10/2025.
//

import Elementary

public struct HighlightJS {
    var languages: [String] = ["csharp", "swift"]
    var importDefaultCSS: Bool = true

    public init() {}
}

// MARK: Self: JSLibrary
extension HighlightJS: JSLibrary {
    public var body: some HTML {
        if importDefaultCSS {
            link.css(path: "https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.11.1/build/styles/default.min.css")
        }
        script(.src(.init(stringLiteral: "https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.11.1/build/highlight.min.js"))) {}
        for language in self.languages {
            script(.src(.init(stringLiteral: "https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.11.1/build/languages/\(language).min.js"))) {}
        }
        script {
            "hljs.highlightAll();"
        }
    }
}
