//
//  Tag.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Foundation

public struct Tag {
    // MARK: Variables
    public var name: String
    public var url: URL

    // MARK: Initializers
    public init(_ name: String, url: URL) {
        self.name = name
        self.url = url
    }
}
