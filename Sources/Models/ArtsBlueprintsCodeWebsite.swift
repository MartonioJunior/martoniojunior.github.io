//
//  Website.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Foundation

public struct ArtsBlueprintsCodeWebsite {
    // MARK: Variables
    /// Owner of this site.
    public let author: String = "Martônio Júnior"
    /// Display name for the website.
    public let name: String = "Arts, Blueprints, Code!"
    /// Description for the website's content.
    public let description: String = "Talking the ABC of Programming, Game Dev, Design and more by Martônio Jr."
    /// Home page of the website.
    public let url: URL = .init(string: "https://martoniojunior.github.io")!
    // MARK: Initializers
    /// Creates an instance of the website.
    public init() {}
}

// MARK: Self.Section
public extension ArtsBlueprintsCodeWebsite {
    typealias Area = Section
}
