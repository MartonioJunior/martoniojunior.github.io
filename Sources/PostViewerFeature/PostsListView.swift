//
//  PostsListView.swift
//  Website
//
//  Created by Martônio Júnior on 14/08/2025.
//

import Elementary
import Foundation
import Models
import Styleguide

/// Component used to create a display of multiple posts.
public struct PostsListView<Content: HTML> {
    // MARK: Variables
    /// Posts to be displayed.
    var posts: [Post]
    /// HTML wrapper for a post.
    var content: (Post) -> Content
    /// How should posts be sorted?
    var sortOrder: SortOrder
    // MARK: Initializers
    /// Creates a new display of posts.
    /// - Parameters:
    ///   - posts: Posts to be displayed.
    ///   - sortOrder: Order to display posts in.
    ///   - content: HTML wrapper for a post.
    ///
    public init(
        _ posts: [Post],
        order sortOrder: SortOrder = .reverse,
        @HTMLBuilder content: @escaping (Post) -> Content = PostCard.init
    ) {
        self.posts = posts
        self.content = content
        self.sortOrder = sortOrder
    }
}

// MARK: Self: HTML
extension PostsListView: HTML {
    // swiftlint:disable:next missing_docs
    public var body: some HTML {
        if posts.isEmpty {
            EmptyView()
        } else {
            ul(.class(.post)) {
                for post in posts.allItems(sortedBy: \.lastUpdate, order: .reverse) {
                    li { content(post) }
                }
            }
        }
    }
}

// MARK: CSSClass (EX)
public extension Class {
    /// Class that defines a post in the list display.
    static var post: Self { #function }
}

// MARK: Sequence (EX)
public extension Sequence {
    /// Sorts values by key path using a specified sort order.
    /// - Parameters:
    ///   - keyPath: Key path for the comparison element.
    ///   - order: Sort order for the elements
    ///
    /// - Returns: Sorted list of elements by `keyPath` in `order`.
    func allItems<T: Comparable>(
        sortedBy keyPath: KeyPath<Element, T>,
        order: SortOrder = .reverse
    ) -> [Element] {
        switch order {
            case .forward:
                sorted { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
            case .reverse:
                sorted { $0[keyPath: keyPath] > $1[keyPath: keyPath] }
        }
    }
}

// MARK: Previews
#if DEBUG && canImport(SwiftUI)
import SwiftUI

#Preview {
    DebugHTML {
        PostsListView(repeatElement(.preview, count: 6).map(\.self))
    }
}
#endif
