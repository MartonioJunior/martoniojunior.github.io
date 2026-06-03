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
extension Post: ExpressibleByMarkdownPage {
    // swiftlint:disable:next missing_docs
    public struct Metadata {
        /// Flag used to indicate publishing the page.
        public var published: Bool
        /// Title of the post.
        public var title: String
        /// Synopsis of the post.
        public var description: String?
        /// Frozen date of creation for the post.
        /// 
        /// When `nil`, uses the metadata of the file itself.
        public var created: String?
        /// Frozen date of last update for the post.
        /// 
        /// When `nil`, uses the metadata of the file itself.
        public var modified: String?
        /// Description of tags associated with the post.
        public var tags: String?
    }
}

extension Post.Metadata: Codable {}

// MARK: Self: Publishable
extension Post: Publishable {
    // swiftlint:disable:next missing_docs
    public var isPublic: Bool { true }
}
