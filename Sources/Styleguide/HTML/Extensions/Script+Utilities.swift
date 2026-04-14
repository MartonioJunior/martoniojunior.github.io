//
//  Script+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 15/10/2025.
//

import Elementary
import Foundation

public extension HTMLElement where Tag == HTMLTag.script {
    func onload(js source: String) -> some HTML {
        self.attributes(.onload(js: source))
    }

    static func inlineSource(from url: URL) throws -> Self where Content == HTMLText {
        let sourceCode = try String(contentsOf: url, encoding: .utf8)

        return .init { sourceCode }
    }
}
