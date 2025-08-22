//
//  TagView.swift
//  Website
//
//  Created by Martônio Júnior on 19/08/2025.
//

import Plot

public struct TagView {
    // MARK: Variables
    var tag: Tag

    // MARK: Initializers
    public init(_ tag: Tag) {
        self.tag = tag
    }
}

// MARK: Self: Component
extension TagView: Component {
    @ComponentBuilder
    public var body: Component {
        Link(tag.name, url: tag.url)
    }
}
