//
//  Post.swift
//  Website
//
//  Created by Martônio Júnior on 14/08/2025.
//

import Elementary
import Foundation

/// Post in the website.
/// 
/// Posts can range from a simple update to a full-fledged article.
public struct Post {
    /// Type that describes content authored for a post.
    public typealias Content = any HTML
    // MARK: Variables
    /// Content associated with this post.
    public var content: Content
    /// When was this post created?
    public var creationDate: Date
    /// When was this post last modified?
    public var lastModified: Date?
    /// Synopsis of what the post is about.
    public var summary: String
    /// Tags associated with this post.
    public var tags: [Tag]
    /// Display title for the post.
    public var title: String
    /// Link to access this post.
    public var url: URL
    /// Date representing the most recent update made for this post.
    public var date: Date { lastModified ?? creationDate }
    // MARK: Initializers
    /// Creates a new post.
    /// - Parameters:
    ///   - title: Display title for this post.
    ///   - summary: Description of the post.
    ///   - created: When was this post created?
    ///   - modified: When was this post last modified?
    ///   - tags: Tags associated with this post.
    ///   - url: Link to access this post
    ///   - content: Content associated with this post.
    ///
    public init<T: HTML>(
        title: String,
        summary: String,
        created: Date,
        modified: Date? = nil,
        tags: [Tag] = [],
        url: URL,
        @HTMLBuilder content: () -> T
    ) {
        self.content = content()
        self.creationDate = created
        self.lastModified = modified
        self.summary = summary
        self.tags = tags
        self.title = title
        self.url = url
    }
}

// MARK: Self: ExpressibleByMarkdownPage
public typealias PostMetadata = Post.Metadata

extension Post: ExpressibleByMarkdownPage {
    // swiftlint:disable:next missing_docs
    public struct Metadata {
        public var published: Bool
        public var title: String
        public var description: String?
        public var created: String?
        public var modified: String?
        public var tags: String?

        public var isPublic: Bool { published }
    }
}

extension PostMetadata: Codable {}
