//
//  Script+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 15/10/2025.
//

import Foundation
import SwiftHTML

public extension Script {
    static func inlineSource(from url: URL) throws -> some HTMLComponent {
        let sourceCode = try String(contentsOf: url, encoding: .utf8)

        return script { sourceCode }
    }

    func onload(js source: String) -> some HTMLComponent {
        attribute("onload", source)
    }
}
