//
//  PostsListView.swift
//  Website
//
//  Created by Martônio Júnior on 14/08/2025.
//

import CSS
import Foundation
import HTML
import Models

public struct PostsListView<Content: HTMLComponent> {
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

// MARK: Self: HTMLComponent
extension PostsListView: HTMLComponent {
    public var body: some HTMLComponent {
        if posts.isEmpty {
            EmptyView()
        } else {
            ul {
                HTMLForEach(posts.allItems(sortedBy: \.date, order: .reverse)) { post in
                    li { content(post) }
                }
            }
            .style(css: .post)
        }
    }
}

// MARK: CSSClass (EX)
public extension SwiftHTML.Class {
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
