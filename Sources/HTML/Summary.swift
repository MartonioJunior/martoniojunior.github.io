//
//  Summary.swift
//  Website
//
//  Created by Martônio Júnior on 21/08/2025.
//

import CSS
import Plot

public struct Summary {
    // MARK: Variables
    var text: String

    // MARK: Initializers
    public init(_ text: String) {
        self.text = text
    }
}

// MARK: Self: Component
extension Summary: Component {
    public var body: Component {
        Div(text).apply(.summary)
    }
}

// MARK: CSSClass (EX)
extension CSSClass {
    static var summary: Self { "summary" }
}
