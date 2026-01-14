//
//  Class+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 20/10/2025.
//

import SwiftHTML

public extension Class {
    /// Represents a Card in the interface
    static var card: Self { "card" }
    /// Represents a set of authored content for the page
    static var content: Self { "content" }
    /// Represents a description for a element in the page
    static var description: Self { "description" }
    /// Represents an entry inside of a list
    static var item: Self { "item" }
    /// Null object definition for CSSClass
    static var none: Self { "" }
    /// Indicates that the component has been selected
    static var selected: Self { "selected" }
    /// Indicates that the content is still a work-in-progress
    static var workInProgress: Self { "wip" }
    /// Flexible layout for application content
    static var wrapper: Self { "wrapper" }
}
