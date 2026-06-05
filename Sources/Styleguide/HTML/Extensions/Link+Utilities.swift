//
//  Link+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 14/04/26.
//

import Elementary

public extension link {
    /// Creates a link to a CSS file.
    /// - Parameter relativePath: Relative path to the CSS file.
    /// - Returns: Formed <link> to the CSS.
    static func css(path relativePath: String) -> Self {
        .init(attributes: [
            .href(relativePath),
            .rel(.stylesheet),
            .type("text/css")
        ])
    }
}
