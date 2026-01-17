//
//  Saga+MarkdownRenderer.swift
//  Website
//
//  Created by Martônio Júnior on 15/01/2026.
//

import Markdown
import Markdown_HTML_Rendering
import MarkdownHTML
import Saga

public extension Reader {
    static func customMarkdownRenderer(for configuration: Markdown.HTML.Configuration) -> Self {
        .init(supportedExtensions: ["markdown", "md"], convert: { absoluteSource in
            let rawContent: String = try absoluteSource.read()
            let document = Document(parsing: rawContent)
            let page = MarkdownPage(document, configuration: configuration)
            return (page.title, try String(page.content), page.metadata?.parameters)
        })
    }
}
