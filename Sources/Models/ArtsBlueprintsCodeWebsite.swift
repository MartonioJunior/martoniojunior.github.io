//
//  Website.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Foundation

public struct ArtsBlueprintsCodeWebsite {
    // MARK: Variables
    public let author: String = "Martônio Júnior"
    public let name: String = "Arts, Blueprints, Code!"
    public let description: String = "Talking the ABC of Programming, Game Dev, Design and more by Martônio Jr."
    public let url: URL = .init(string: "https://martoniojunior.github.io")!

    // MARK: Initializers
    public init() {}
}

// MARK: Self.Section
public extension ArtsBlueprintsCodeWebsite {
    typealias Area = Section
}
