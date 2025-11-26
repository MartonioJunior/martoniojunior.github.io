//
//  PostCard.swift
//  Website
//
//  Created by Martônio Júnior on 14/08/2025.
//

import HTML
import Models
import TagViewerFeature

public struct PostCard {
    // MARK: Variables
    var post: Post

    // MARK: Initializers
    public init(_ post: Post) {
        self.post = post
    }
}

// MARK: Self: HTMLComponent
extension PostCard: HTMLComponent {
    public var body: some HTMLComponent {
        article {
            h1 { a(href: .init(post.url)) { post.title } }
            if !post.tags.isEmpty {
                TagsListView(post.tags)
            }
            Time.date(post.date)
            Description(post.summary)
        }
    }
}
