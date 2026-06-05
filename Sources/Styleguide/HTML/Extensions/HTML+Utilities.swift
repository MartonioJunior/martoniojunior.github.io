//
//  HTML+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 14/10/2025.
//

import Elementary

public extension HTML {
    /// Renders the HTML component into a raw representation.
    ///
    /// - Returns: Raw HTML for the component.
    func eraseToRawHTML() -> HTMLRaw {
        HTMLRaw(render())
    }
}
