//
//  PostDetailsView.swift
//  Website
//
//  Created by Martônio Júnior on 19/08/2025.
//

import CSS
import HTML
import Plot
import TagsFeature

public struct PostDetailsView {
    // MARK: Variables
    var post: Post

    // MARK: Initializers
    public init(_ post: Post) {
        self.post = post
    }
}

// MARK: Self: Component
extension PostDetailsView: Component {
    @ComponentBuilder
    public var body: Component {
        Div {
            Article {
                H1(post.title)
                Summary(post.summary)
                Div(post.content).apply(.content)
                if !post.tags.isEmpty {
                    Span("Tagged with: ")
                    TagsListView(post.tags)
                }
            }
        }
    }
}
