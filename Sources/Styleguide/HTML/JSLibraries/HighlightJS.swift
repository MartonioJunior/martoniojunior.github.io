//
//  HighlightJS.swift
//  Website
//
//  Created by Martônio Júnior on 15/10/2025.
//

import Elementary

/// Definition for [Highlight.js](https://highlightjs.org) render plugin.
/// 
/// Used to add code syntax highlighting to snippets in the website.
public struct HighlightJS {
    /// Languages to be imported.
    var languages: [String] = ["csharp", "swift"]
    /// Should the module import the default CSS for highlight.js?
    var importDefaultCSS: Bool = true
    /// Instances Highlight.js for use.
    public init() {}
}

// MARK: Self: JSLibrary
extension HighlightJS: JSLibrary {
    // swiftlint:disable:next missing_docs
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
