//
//  Link+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 14/04/26.
//

import Elementary

public extension link {
    static func css(path relativePath: String) -> Self {
        .init(attributes: [
            .href(relativePath),
            .rel(.stylesheet),
            .type("text/css")
        ])
    }
}
