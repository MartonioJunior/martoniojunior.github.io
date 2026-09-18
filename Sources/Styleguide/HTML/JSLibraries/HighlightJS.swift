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
    /// Version of the library to import.
    var version: String = "11.12.0"
    /// Languages to be imported.
    var languages: [String] = ["csharp", "swift"]
    /// Should the module import the default CSS for highlight.js?
    var importDefaultCSS: Bool = false
    /// Instances Highlight.js for use.
    public init() {}
}

// MARK: Self: JSLibrary
extension HighlightJS: JSLibrary {
    // swiftlint:disable:next missing_docs
    public var body: some HTML {
        if importDefaultCSS {
            link.css(path: "https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@\(version)/build/styles/default.min.css")
        }
        script(.src(.init(stringLiteral: "https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@\(version)/build/highlight.min.js"))) {}
        for language in self.languages {
            script(.src(.init(stringLiteral: "https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@\(version)/build/languages/\(language).min.js"))) {}
        }
        script {
            "hljs.highlightAll();"
        }
    }
}
