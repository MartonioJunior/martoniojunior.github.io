//
//  MarkdownPage.swift
//  Website
//
//  Created by Martônio Júnior on 16/01/2026.
//

import Markdown
import Markdown_HTML_Rendering

public struct MarkdownPage {
    // MARK: Variables
    public var content: any WHATWG_HTML.View
    public var title: String
    public var metadata: MarkdownMetadata?

    // MARK: Initializers
    public init(_ document: Document) {
        metadata = document.metadata
        content = Markdown.HTML {
            var metadataRemover = MarkdownMetadataRemover()
            document.accept(&metadataRemover)?.format()
        }

        title = document.title ?? "Untitled"
    }
}
