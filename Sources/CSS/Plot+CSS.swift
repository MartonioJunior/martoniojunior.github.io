//
//  Component+CSS.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Plot

// MARK: Component (EX)
public extension Component {
    func apply(_ class: CSSClass) -> Component {
        self.class(`class`.name)
    }

    func apply(_ classes: [CSSClass]) -> Component {
        classes.reduce(self) {
            $0.apply($1)
        }
    }
}

// MARK: Node (EX)
public extension Node where Context == HTML.BodyContext {
    static func apply(_ class: CSSClass) -> Self {
        .class(`class`.name)
    }
}
