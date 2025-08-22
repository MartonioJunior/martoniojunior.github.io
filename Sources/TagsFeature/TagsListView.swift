//
//  TagListView.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import CSS
import Plot

public struct TagsListView {
    var tags: [Tag]
    var content: (Tag) -> Component

    // MARK: Initializers
    public init(
        _ tags: [Tag],
        @ComponentBuilder content: @escaping (Tag) -> Component = TagView.init
    ) {
        self.tags = tags
        self.content = content
    }
}

// MARK: Self: Component
extension TagsListView: Component {
    public var body: Component {
        List(tags) { tag in
            content(tag)
        }
        .apply(.tag)
    }
}
