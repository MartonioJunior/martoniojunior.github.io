//
//  Reader+Website.swift
//  StaticSiteGenerator
//
//  Created by Martônio Júnior on 15/01/2026.
//

import Markdown
import MarkdownHTML
import Saga
import SagaParsleyMarkdownReader

public extension Reader {
    /// Reader used to process markdown into HTML
    static var websiteDefault: Self {
        .parsleyMarkdownReader(syntaxExtensions: .websiteDefault)
    }

    static func customMarkdownRenderer() -> Self {
        .init(supportedExtensions: ["markdown", "md"]) { absoluteSource in
            let rawContent: String = try absoluteSource.read()
            let document = Document(parsing: rawContent)
            let page = MarkdownPage(document)
            return (page.title, page.content, page.metadata?.parameters)
        }
    }
}
