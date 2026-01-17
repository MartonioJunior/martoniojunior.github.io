//
//  PostDetailsView.swift
//  Website
//
//  Created by Martônio Júnior on 19/08/2025.
//

import CSS
import HTML
import Models
import Styleguide
import TagViewerFeature

public struct PostDetailsView {
    // MARK: Variables
    var post: Post

    // MARK: Initializers
    public init(_ post: Post) {
        self.post = post
    }
}

// MARK: Self: HTML.View
extension PostDetailsView: HTML.View {
    public var body: some HTML.View {
        article {
            h1 { post.title }
            p { post.summary }.class(.description)
            p {
                "Posted "
                Time.date(post.creationDate)
                if let lastModified = post.lastModified {
                    ", Last Updated "
                    Time.date(lastModified)
                }
            }.class(.timestamps)
            div { post.content }.class(.content)
            if !post.tags.isEmpty {
                span { "Tagged with: " }
                TagsListView(post.tags)
            }
        }
    }
}

// MARK: Class (EX)
public extension Class {
    static var timestamps: Self { "timestamps" }
}

// MARK: Preview
#if canImport(SwiftUI)
import SwiftUI

public extension Post {
    static var preview: Self {
        .init(
            title: "Something about Apples",
            summary: "A detailed showcase of how apples work",
            created: .distantPast,
            modified: .now,
            url: URL(string: "/test/element")!
        ) {
            h1 { "Cool Post" }
            p { "This is a paragraph." }
        }
    }
}

#Preview {
    HTML.Document {
        PostDetailsView(Post.preview)
    } head: {
        title { "Post Example" }
        Meta(charset: .utf8)
    }
}

#endif
