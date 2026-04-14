//
//  TagsBrowserView.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Elementary
import Models
import Styleguide

// TODO: Transform Tag Browsing into it's own module
public struct TagsBrowserView {
    // MARK: Variables
    var tags: [Tag]

    // MARK: Initializers
    public init(_ tags: [Tag]) {
        self.tags = tags
    }
}

// MARK: Self: HTML
extension TagsBrowserView: HTML {
    public var body: some HTML {
        h1 { "Browse all tags" }
        div(.class(.tagBrowser)) {
            TagsListView(tags) { tag in
                li(.class(.tag)) {
                    TagView(tag)
                }
            }
        }
    }
}

// MARK: CSS Classes (EX)
public extension Class {
    static var tag: Self { "tag" }
    internal static var tagBrowser: Self { "tag-browser" }
}
