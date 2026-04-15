//
//  PostDetailsView.swift
//  Website
//
//  Created by Martônio Júnior on 19/08/2025.
//

import Elementary
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

// MARK: Self: HTML
extension PostDetailsView: HTML {
    public var body: some HTML {
        article {
            h1 { post.title }
            p(.class(.description)) { post.summary }
            p(.class(.timestamps)) {
                "Posted "
                time.date(post.creationDate)
                if let lastModified = post.lastModified {
                    ", Last Updated "
                    time.date(lastModified)
                }
            }
            div(.class(.content)) {
                post.content.eraseToRawHTML()
            }
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

// TODO: Fix this preview
#Preview {
    DebugHTML {
        PostDetailsView(Post.preview)
    }
}

#endif
