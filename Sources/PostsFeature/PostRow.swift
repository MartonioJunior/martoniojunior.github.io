//
//  PostRow.swift
//  Website
//
//  Created by Martônio Júnior on 14/08/2025.
//

import HTML
import Plot
import TagsFeature

public struct PostRow {
    // MARK: Variables
    var post: Post

    // MARK: Initializers
    public init(_ post: Post) {
        self.post = post
    }
}

// MARK: Self: Component
extension PostRow: Component {
    public var body: Component {
        Article {
            H1(Link(post.title, url: post.url))
            DateView(post.date)
            if !post.tags.isEmpty {
                TagsListView(post.tags)
            }
            Summary(post.summary)
        }
    }
}
