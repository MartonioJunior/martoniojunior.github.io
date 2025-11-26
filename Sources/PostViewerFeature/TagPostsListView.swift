//
//  TagPostsListView.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import CSS
import HTML
import Models
import TagViewerFeature

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

// MARK: Self: HTMLComponent
extension TagPostsListView: HTMLComponent {
    public var body: some HTMLComponent {
        h1 {
            "Tagged with "
            span { tag.name }.style(css: .tag)
        }

        a(href: .init(tag.url)) { "Browse all tags" }

        PostsListView(posts)
    }
}
