//
//  PostsListView.swift
//  Website
//
//  Created by Martônio Júnior on 14/08/2025.
//

import CSS
import Plot

public struct PostsListView {
    // MARK: Variables
    var posts: [Post]
    var content: (Post) -> Component

    // MARK: Initializers
    public init(
        _ posts: [Post],
        @ComponentBuilder content: @escaping (Post) -> Component = PostRow.init
    ) {
        self.posts = posts
        self.content = content
    }
}

// MARK: Self: Component
extension PostsListView: Component {
    public var body: Component {
        if posts.isEmpty {
            EmptyPostsListView()
        } else {
            List(posts) {
                content($0)
            }
            .apply(.post)
        }
    }
}

// MARK: CSSClass (EX)
public extension CSSClass {
    static var post: Self { "post" }
}
