//
//  HTMLAttributes+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 14/04/26.
//

import Elementary
import Foundation

// MARK: General
public extension HTMLAttribute where Tag: HTMLTrait.Attributes.Global {
    /// Defines a class for the element.
    /// - Parameter class: Class for the element.
    /// - Returns: A new attribute with the given class.
    static func `class`(_ class: Class) -> Self {
        .class(`class`.value)
    }
}

public extension HTMLAttribute where Tag: HTMLTrait.Paired {
    /// Defines a class for the element.
    /// - Parameter class: Class for the element.
    /// - Returns: A new attribute with the given class.
    static func `class`(_ class: Class) -> Self {
        .class(`class`.value)
    }
}

// MARK: <link>
public extension HTMLAttribute where Tag == HTMLTag.link {
    /// Defines the type of link that's being loaded in.
    /// - Parameter type: Type of link.
    /// - Returns: A new <link> attribute.
    static func type(_ type: String) -> Self {
        .init(name: "type", value: type)
    }
}

// MARK: <script>
public extension HTMLAttribute where Tag == HTMLTag.script {
    /// Defines a script to be loaded in. 
    /// - Parameter source: Path to the source file.
    /// - Returns: <script> attribute with a JavaScript to run on load.
    static func onload(js source: String) -> Self {
        .init(name: "onload", value: source)
    }
}

// MARK: <time>
public extension HTMLAttribute where Tag == HTMLTag.time {
    /// Creates a new <time> attribute for a given date.
    /// - Parameter date: Date associated with this item.
    /// - Returns: A new <time> attribute with formatted `date`.
    static func dateTime(_ date: Date) -> Self {
        .init(name: "datetime", value: date.formatted())
    }
}
