//
//  Summary.swift
//  Website
//
//  Created by Martônio Júnior on 21/08/2025.
//

import CSS
import HTML

public struct Description {
    // MARK: Variables
    var text: String

    // MARK: Initializers
    public init(_ text: String) {
        self.text = text
    }
}

// MARK: Self: HTML.View
extension Description: HTML.View {
    public var body: some HTML.View {
        p { text }.descriptionStyle()
    }
}

// MARK: HTMLComponent (EX)
public extension HTMLComponent {
    func descriptionStyle() -> some HTML.View {
        `class`(.description)
        // fontFamily(nil) // Secondary Font
        // .fontStyle(.italic)
        // .marginTop(.px(4))
    }
}
