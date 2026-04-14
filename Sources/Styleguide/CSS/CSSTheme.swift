//
//  CSSTheme.swift
//  Website
//
//  Created by Martônio Júnior on 20/10/2025.
//

import Elementary

public struct CSSTheme {
    // MARK: Variables
    public var folder: String
}

// MARK: DotSyntax
public extension CSSTheme {
    static var energyTheme: Self {
        .init(folder: "/Resources/EnergyTheme")
    }

    static func reference(relativePath: String) -> link {
        .css(path: relativePath)
    }
    
    func reference(subpath: String) -> link {
        Self.reference(relativePath: "\(folder)/\(subpath)")
    }
}
