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
    static func `class`(_ class: Class) -> Self {
        .class(`class`.value)
    }
}

public extension HTMLAttribute where Tag: HTMLTrait.Paired {
    static func `class`(_ class: Class) -> Self {
        .class(`class`.value)
    }
}

// MARK: <link>
public extension HTMLAttribute where Tag == HTMLTag.link {
    static func type(_ type: String) -> Self {
        .init(name: "type", value: type)
    }
}

// MARK: <script>
public extension HTMLAttribute where Tag == HTMLTag.script {
    static func onload(js source: String) -> Self {
        .init(name: "onload", value: source)
    }
}

// MARK: <time>
public extension HTMLAttribute where Tag == HTMLTag.time {
    static func dateTime(_ date: Date) -> Self {
        .init(name: "datetime", value: date.formatted())
    }
}
