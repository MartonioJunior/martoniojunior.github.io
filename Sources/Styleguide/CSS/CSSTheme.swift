//
//  CSSTheme.swift
//  Website
//
//  Created by Martônio Júnior on 20/10/2025.
//

import Elementary

/// Group of CSS files for styling a web page.
public struct CSSTheme {
    // MARK: Variables
    /// Relative path to the location containing the CSS files.
    public var folder: String
}

// MARK: DotSyntax
public extension CSSTheme {
    /// CSS Theme associated with the website.
    static var energyTheme: Self {
        .init(folder: "/Resources/EnergyTheme")
    }
    /// Details a link reference to a CSS file in the theme.
    /// - Parameter subpath: Relative path from the theme to the CSS file.
    /// - Returns: A link referencing the CSS file.
    func reference(subpath: String) -> link {
        Self.reference(relativePath: "\(folder)/\(subpath)")
    }
    /// Defines a CSS theme from a relative path.
    /// - Parameter relativePath: Relative path to the CSS files.
    /// - Returns: A new CSS theme.
    static func reference(relativePath: String) -> link {
        .css(path: relativePath)
    }
}
