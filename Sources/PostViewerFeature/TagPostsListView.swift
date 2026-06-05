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

/// Display for a tag associated with one or more posts.
public struct TagPostsListView {
    // MARK: Variables
    /// Tag used as the reference for the display.
    var tag: Tag
    /// List of posts containing this tag.
    var posts: [Post]
    // MARK: Initializers
    /// Creates a display for the posts associated with a tag.
    /// - Parameters:
    ///   - tag: Tag used as the reference for the display.
    ///   - posts: List of posts containing this tag.
    ///
    public init(tag: Tag, posts: [Post]) {
        self.tag = tag
        self.posts = posts
    }
}

// MARK: Self: HTML
extension TagPostsListView: HTML {
    // swiftlint:disable:next missing_docs
    public var body: some HTML {
        h1 {
            "Tagged with "
            span(.class(.tag)) { tag.name }
        }

        a(.href(tag.url.relativePath)) { "Browse all tags" }

        PostsListView(posts)
    }
}

#if DEBUG && canImport(SwiftUI)
import SwiftUI

#Preview {
    DebugHTML {
        TagPostsListView(
            tag: .init("Soccer", url: .init(string: "/soccer")!),
            posts: repeatElement(.preview, count: 6).map(\.self)
        )
    }
}
#endif
