//
//  Document+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 16/01/26.
//

import Markdown

public extension Document {
    var title: String? {
        onlyChildren(ofType: Heading.self).first { $0.level == 1 }?.plainText
    }
}
