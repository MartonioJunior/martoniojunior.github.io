//
//  CSSTheme.swift
//  Website
//
//  Created by Martônio Júnior on 20/10/2025.
//

import CSS
import HTML

public struct CSSTheme {
    // MARK: Variables
    public var folder: String
}

// MARK: DotSyntax
public extension CSSTheme {
    static var energyTheme: Self {
        .init(folder: "/Resources/EnergyTheme")
    }

    static func reference(relativePath: String) -> Link {
        link(href: .init(value: relativePath), rel: .stylesheet, type: .css)
    }
    
    func reference(subpath: String) -> Link {
        Self.cssTheme(relativePath: "\(theme.folder)/\(subpath)")
    }
}
