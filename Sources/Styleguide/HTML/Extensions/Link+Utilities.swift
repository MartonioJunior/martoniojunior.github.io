//
//  Link+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 16/10/2025.
//

import CSS
import Foundation
import SwiftHTML

public extension Link {
    static func css(relativePath: String) -> Self {
        link(href: .init(value: relativePath), rel: .stylesheet, type: .css)
    }

    static func css(from theme: CSSTheme, path: String) -> Self {
        .css(relativePath: "\(theme.folder)/\(path)")
    }
}
