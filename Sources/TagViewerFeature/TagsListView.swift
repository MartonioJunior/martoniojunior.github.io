//
//  TagListView.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Elementary
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

// MARK: Self: HTML
extension TagsListView: HTML {
    public var body: some HTML {
        ul(.class(.tag)) {
            for tag in tags {
                li { content(tag) }
            }
        }
    }
}
