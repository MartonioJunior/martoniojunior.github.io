//
//  MarkdownPage.swift
//  Website
//
//  Created by Martônio Júnior on 16/01/2026.
//

import Elementary
import Markdown
import Parsley

/// Data structure representing a pre-processed Markdown page.
public struct MarkdownPage {
    /// Type of content associated with this page.
    public typealias Content = String
    // MARK: Variables
    /// Content of this page.
    public var content: Content
    /// Display title for this page.
    public var title: String
    /// Metadata associated with this page.
    public var metadata: MarkdownMetadata?
    // MARK: Initializers
    /// Creates a new instance by pre-processing a Markdown Document.
    /// - Parameter document: Markdown document to be pre-processed.
    public init(_ document: Markdown.Document) {
        let parsed = try? Parsley.parse(document.format())

        if let parsedMetadata = parsed?.metadata {
            metadata = .init(parsedMetadata)
        } else {
            metadata = document.metadata
        }

        content = parsed?.body ?? ""
        title = parsed?.title ?? document.title ?? "Untitled"
    }
}
