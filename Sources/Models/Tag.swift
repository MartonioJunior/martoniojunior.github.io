//
//  Tag.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Foundation

/// Structure that represents a content tag in the website.
public struct Tag {
    // MARK: Variables
    /// Name of the tag.
    public var name: String
    /// Page of the tag in the website.
    public var url: URL
    // MARK: Initializers
    /// Creates a new tag.
    /// - Parameters:
    ///   - name: Name of the tag.
    ///   - url: URL to the tag's page.
    ///
    public init(_ name: String, url: URL) {
        self.name = name
        self.url = url
    }
}

// MARK: Self: ExpressibleByStringLiteral
extension Tag: ExpressibleByStringLiteral {
    // swiftlint:disable:next missing_docs
    public init(stringLiteral value: String) {
        self.init(value, url: .init(string: "/tags/\(value)")!)
    }
}
