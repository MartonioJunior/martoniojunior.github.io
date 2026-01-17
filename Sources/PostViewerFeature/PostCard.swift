//
//  PostCard.swift
//  Website
//
//  Created by Martônio Júnior on 14/08/2025.
//

import HTML
import Models
import Styleguide
import TagViewerFeature

public struct PostCard {
    // MARK: Variables
    var post: Post

    // MARK: Initializers
    public init(_ post: Post) {
        self.post = post
    }
}

// MARK: Self: HTML.View
extension PostCard: HTML.View {
    public var body: some HTML.View {
        article {
            h1 { a(href: .init(post.url.relativePath)) { post.title } }
            if !post.tags.isEmpty {
                TagsListView(post.tags)
            }
            Time.date(post.date)
            p { post.summary }.class(.description)
        }
    }
}
