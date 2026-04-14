//
//  Saga+MarkdownRenderer.swift
//  Website
//
//  Created by Martônio Júnior on 15/01/2026.
//

import Markdown
import MarkdownHTML
import Saga

public extension Reader {
    static func customMarkdownRenderer() -> Self {
        .init(supportedExtensions: ["markdown", "md"], convert: { absoluteSource in
            let rawContent: String = try absoluteSource.read()
            let document = Document(parsing: rawContent)
            let page = MarkdownPage(document)
            return (page.title, page.content, page.metadata?.parameters)
        })
    }
}
