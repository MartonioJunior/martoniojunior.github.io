//
//  Style+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 16/10/2025.
//

import Foundation
import SwiftHTML

public extension style {
    static func inlineSource(from url: URL) throws -> some HTMLComponent {
        let sourceCode = try String(contentsOf: url, encoding: .utf8)

        return style { sourceCode }
    }
}
