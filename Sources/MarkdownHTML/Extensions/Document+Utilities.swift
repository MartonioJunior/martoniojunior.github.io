//
//  Document+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 16/01/26.
//

import Markdown

public extension Document {
    /// Returns the display title inside of a Markdown file.
    var title: String? {
        onlyChildren(ofType: Heading.self).first { $0.level == 1 }?.plainText
    }
}
