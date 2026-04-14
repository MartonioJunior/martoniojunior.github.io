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

public struct PostsListView<Content: HTML> {
    // MARK: Variables
    var posts: [Post]
    var content: (Post) -> Content
    var sortOrder: SortOrder

    // MARK: Initializers
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
    public var body: some HTML {
        if posts.isEmpty {
            EmptyView()
        } else {
            ul(.class(.post)) {
                for post in posts.allItems(sortedBy: \.date, order: .reverse) {
                    li { content(post) }
                }
            }
        }
    }
}

// MARK: CSSClass (EX)
public extension Class {
    static var post: Self { "post" }
}

// MARK: Sequence (EX)
public extension Sequence {
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
