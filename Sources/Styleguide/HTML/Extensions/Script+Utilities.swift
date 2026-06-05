//
//  Script+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 15/10/2025.
//

import Elementary
import Foundation

public extension HTMLElement where Tag == HTMLTag.script {
    /// Defines a JavaScript file to be executed on load.
    /// - Parameter source: Path to the source file.
    /// - Returns: <script> with the source executed on load.
    func onload(js source: String) -> some HTML {
        attributes(.onload(js: source))
    }
    /// Creates an inline <script> from a source file.
    /// - Parameter url: URL for the script's source file.
    /// - Throws: Error when the contents of `url` failed to be loaded.
    /// - Returns: The defined <script> source.
    static func inlineSource(from url: URL) throws -> Self where Content == HTMLText {
        let sourceCode = try String(contentsOf: url, encoding: .utf8)

        return .init { sourceCode }
    }
}
