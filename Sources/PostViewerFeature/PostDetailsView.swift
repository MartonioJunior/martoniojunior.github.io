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

/// Component that displays a full post of the website.
public struct PostDetailsView {
    // MARK: Variables
    /// Post to be displayed.
    var post: Post
    // MARK: Initializers
    /// Creates a detailed view for a post.
    /// - Parameter post: Post to be displayed.
    public init(_ post: Post) {
        self.post = post
    }
}

// MARK: Self: HTML
extension PostDetailsView: HTML {
    // swiftlint:disable:next missing_docs
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
            displayTags()
        }
    }
    /// Displays the tags associated with a post.
    @HTMLBuilder
    func displayTags() -> some HTML {
        if !post.tags.isEmpty {
            span { "Tagged with: " }
            TagsListView(post.tags)
        }
    }
}

// MARK: Class (EX)
public extension Class {
    /// Class to apply styling for timestamps.
    static var timestamps: Self { #function }
}

// MARK: Preview
#if canImport(SwiftUI)
import SwiftUI

public extension Post {
    /// Preview of what a post looks like.
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
    DebugHTML {
        PostDetailsView(.preview)
    }
}
#endif
