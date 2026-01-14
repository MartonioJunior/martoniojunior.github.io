//
//  CSSTheme.swift
//  Website
//
//  Created by Martônio Júnior on 20/10/2025.
//

public struct CSSTheme {
    public var folder: String
}

public extension CSSTheme {
    static var energyTheme: Self {
        .init(folder: "/Resources/EnergyTheme")
    }
}
