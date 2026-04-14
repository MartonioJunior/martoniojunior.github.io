//
//  MarkdownPage.swift
//  Website
//
//  Created by Martônio Júnior on 16/01/2026.
//

import Elementary
import Markdown
import Parsley

public struct MarkdownPage {
    public typealias Content = String
    
    // MARK: Variables
    public var content: Content
    public var title: String
    public var metadata: MarkdownMetadata?

    // MARK: Initializers
    public init(_ document: Markdown.Document) {
        let parsed = try? Parsley.parse(document.format())
        metadata = MarkdownMetadata(parameters: parsed?.metadata ?? document.metadataDictionary)
        content = parsed?.body ?? ""
        title = parsed?.title ?? document.title ?? "Untitled"
    }
}
