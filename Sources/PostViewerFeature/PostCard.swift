//
//  PostCard.swift
//  Website
//
//  Created by Martônio Júnior on 14/08/2025.
//

import Elementary
import Models
import Styleguide
import TagViewerFeature

/// Card that shows basic information about a post.
public struct PostCard {
    // MARK: Variables
    /// Post to be displayed.
    var post: Post
    // MARK: Initializers
    /// Creates a new card for a post.
    /// - Parameter post: Post to be displayed.
    public init(_ post: Post) {
        self.post = post
    }
}

// MARK: Self: HTML
extension PostCard: HTML {
    // swiftlint:disable:next missing_docs
    public var body: some HTML {
        article {
            h1 {
                a(.href(post.url.relativePath)) { post.title }
            }
            if !post.tags.isEmpty {
                TagsListView(post.tags)
            }
            time.date(post.lastUpdate)
            p(.class(.description)) { post.summary }
        }
    }
}

#if DEBUG && canImport(SwiftUI)
import SwiftUI

#Preview {
    DebugHTML {
        PostCard(.preview)
    }
}
#endif
