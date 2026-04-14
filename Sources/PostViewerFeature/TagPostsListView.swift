//
//  TagPostsListView.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Elementary
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

// MARK: Self: HTML
extension TagPostsListView: HTML {
    public var body: some HTML {
        h1 {
            "Tagged with "
            span(.class(.tag)) { tag.name }
        }

        a(.href(tag.url.relativePath)) { "Browse all tags" }

        PostsListView(posts)
    }
}
