//
//  TagView.swift
//  Website
//
//  Created by Martônio Júnior on 19/08/2025.
//

import HTML
import Models

public struct TagView {
    // MARK: Variables
    var tag: Tag

    // MARK: Initializers
    public init(_ tag: Tag) {
        self.tag = tag
    }
}

// MARK: Self: HTML.View
extension TagView: HTML.View {
    public var body: some HTML.View {
        a(href: .init(tag.url.relativePath)) { tag.name }
    }
}
