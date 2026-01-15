//
//  Post.swift
//  Website
//
//  Created by Martônio Júnior on 14/08/2025.
//

import Foundation
import HTML

public struct Post {
    public typealias Content = AnyHTML

    // MARK: Variables
    public var content: Content
    public var creationDate: Date
    public var lastModified: Date?
    public var summary: String
    public var tags: [Tag]
    public var title: String
    public var url: URL

    public var date: Date { lastModified ?? creationDate }

    // MARK: Initializers
    public init<T: HTML.View>(
        title: String,
        summary: String,
        created: Date,
        modified: Date? = nil,
        tags: [Tag] = [],
        url: URL,
        @HTML.Builder content: () -> T
    ) {
        self.content = AnyHTML(content)
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
    /// Data that can be processed from the original Markdown content
    public struct Metadata {
        public var published: Bool
        public var title: String
        public var description: String?

        public var isPublic: Bool { published }
    }
}

extension PostMetadata: Decodable {}
