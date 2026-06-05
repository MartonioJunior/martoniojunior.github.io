//
//  Class+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 20/10/2025.
//

/// HTML class.
public struct Class {
    /// Name for the class.
    var value: String
}

// MARK: DotSyntax
public extension Class {
    /// Represents a Card in the interface
    static var card: Self { #function }
    /// Represents a set of authored content for the page
    static var content: Self { #function }
    /// Represents a description for a element in the page
    static var description: Self { #function }
    /// Represents an entry inside of a list
    static var item: Self { #function }
    /// Indicates that the component has been selected
    static var selected: Self { #function }
    /// Indicates that the content is still a work-in-progress
    static var workInProgress: Self { "wip" }
    /// Flexible layout for application content
    static var wrapper: Self { #function }
}

// MARK: Self: ExpressibleByStringLiteral
extension Class: ExpressibleByStringLiteral {
    // swiftlint:disable:next missing_docs
    public init(stringLiteral value: String) {
        self.value = value
    }
}
