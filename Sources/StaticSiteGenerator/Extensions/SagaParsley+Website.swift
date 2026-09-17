//
//  SagaParsley+Website.swift
//  Website
//
//  Created by Martônio Júnior on 17/09/2026.
//

import Parsley
import Saga
import SagaParsleyMarkdownReader

// MARK: SyntaxExtension (EX)
public extension Array where Element == SyntaxExtension {
    /// Syntax extensions used in the website.
    static var websiteDefault: Self {
        [
            .autolink,
            .strikethrough,
            .table,
            // .tagfilter, // Disables some HTML tags from being used that are part of posts currently.
            .tasklist
        ]
    }
}
