//
//  TagListView.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import CSS
import HTML
import Models

public struct TagsListView<Content: HTML> {
    var tags: [Tag]
    var content: (Tag) -> Content

    // MARK: Initializers
    public init(
        _ tags: [Tag],
        @HTMLBuilder content: @escaping (Tag) -> Content = TagView.init
    ) {
        self.tags = tags
        self.content = content
    }
}

// MARK: Self: HTMLComponent
extension TagsListView: HTMLComponent {
    public var body: some HTMLComponent {
        ul {
            HTMLForEach(tags) { tag in
                li { content(tag) }
            }
        }.style(css: .tag)
    }
}
