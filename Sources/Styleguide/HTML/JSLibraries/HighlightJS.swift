//
//  HighlightJS.swift
//  Website
//
//  Created by Martônio Júnior on 15/10/2025.
//

import SwiftHTML

public struct HighlightJS {
    var languages: [String] = ["csharp", "swift"]
    var importDefaultCSS: Bool = true

    public init() {}
}

// MARK: Self: JSLibrary
extension HighlightJS: JSLibrary {
    public var body: some HTMLComponent {
        if importDefaultCSS {
            link(
                href: "https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.11.1/build/styles/default.min.css",
                rel: .stylesheet,
            )
        }
        script(
            src: "https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.11.1/build/highlight.min.js"
        )
        HTMLForEach(languages) { language in
            script(
                src: "https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.11.1/build/languages/\(language).min.js"
            )
        }
        script {
            "hljs.highlightAll();"
        }
    }
}
