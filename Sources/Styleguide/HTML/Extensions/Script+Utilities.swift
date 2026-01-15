//
//  Script+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 15/10/2025.
//

import Foundation
import HTML

public extension Script {
    func onload(js source: String) -> some HTML.View {
        attribute("onload", source)
    }

    static func inlineSource(from url: URL) throws -> some HTML.View {
        let sourceCode = try String(contentsOf: url, encoding: .utf8)

        return script { sourceCode }
    }
}
