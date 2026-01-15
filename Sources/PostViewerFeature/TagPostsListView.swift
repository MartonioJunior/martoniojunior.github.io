//
//  TagPostsListView.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import CSS
import HTML
import Models
import Styleguide
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

// MARK: Self: HTML.View
extension TagPostsListView: HTML.View {
    public var body: some HTML.View {
        h1 {
            "Tagged with "
            span { tag.name }.class(.tag)
        }

        a(href: .init(tag.url.relativePath)) { "Browse all tags" }

        PostsListView(posts)
    }
}
