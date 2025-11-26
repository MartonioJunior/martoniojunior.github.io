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

// MARK: Self: HTMLComponent
extension TagView: HTMLComponent {
    public var body: some HTMLComponent {
        a(href: .init(tag.url)) { tag.name }
    }
}
