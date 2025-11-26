//
//  PostDetailsView.swift
//  Website
//
//  Created by Martônio Júnior on 19/08/2025.
//

import CSS
import HTML
import Models
import TagViewerFeature

public struct PostDetailsView {
    // MARK: Variables
    var post: Post

    // MARK: Initializers
    public init(_ post: Post) {
        self.post = post
    }
}

// MARK: Self: HTMLComponent
extension PostDetailsView: HTMLComponent {
    public var body: some HTMLComponent {
        article {
            h1 { post.title }
            Description(post.summary)
            p {
                "Posted "
                Time.date(post.created)
                if let lastModified = post.lastModified {
                    ", Last Updated "
                    Time.date(lastModified)
                }
            }.style(css: .timestamps)
            div { post.content }.style(css: .content)
            if !post.tags.isEmpty {
                span { "Tagged with: " }
                TagsListView(post.tags)
            }
        }
    }
}

// MARK: Class (EX)
public extension SwiftHTML.Class {
    static var timestamps: Self { "timestamps" }
}

// MARK: Preview
#if canImport(SwiftUI)
import SwiftUI

#Preview {
    let post = Post(
        title: "Something about Apples",
        summary: "A detailed showcase of how apples work",
        created: .distantPast,
        modified: .now,
        url: URL(string: "/test/element")!
    ) {
        h1 { "Cool Post" }
        p { "This is a paragraph." }
    }

    HTMLDocument {
        PostDetailsView(post)
    } head: {
        title { "Post Example" }
        meta(charset: .utf8)()
    }
}

#endif
