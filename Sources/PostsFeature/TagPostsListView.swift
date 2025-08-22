//
//  TagPostsListView.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import CSS
import Plot
import TagsFeature

public struct TagPostsListView {
    // MARK: Variables
    var tag: Tag
    var posts: [Post]

    // MARK: Initializers
    public init(tag: Tag, posts: [Post]) {
        self.tag = tag
        self.posts = posts
    }
}

// MARK: Self: Component
extension TagPostsListView: Component {
    @ComponentBuilder
    public var body: Component {
        H1 {
            Text("Tagged with ")
            Span(tag.name).apply(.tag)
        }

        Link("Browse all tags", url: tag.url)

        PostsListView(posts)
    }
}
