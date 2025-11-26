//
//  Summary.swift
//  Website
//
//  Created by Martônio Júnior on 21/08/2025.
//

import CSS

public struct Description {
    // MARK: Variables
    var text: String

    // MARK: Initializers
    public init(_ text: String) {
        self.text = text
    }
}

// MARK: Self: HTMLComponent
extension Description: HTMLComponent {
    public var body: some HTMLComponent {
        p { text }.descriptionStyle()
    }
}

// MARK: HTMLComponent (EX)
public extension HTMLComponent {
    func style(css cssClass: SwiftHTML.Class) -> some HTML {
        `class`(cssClass)
    }

    func descriptionStyle() -> some HTML {
        style(css: .description)
        // fontFamily(nil) // Secondary Font
        // .fontStyle(.italic)
        // .marginTop(.px(4))
    }
}
