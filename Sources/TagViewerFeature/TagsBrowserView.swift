//
//  TagsBrowserView.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import CSS
import HTML
import Models

// TODO: Transform Tag Browsing into it's own module
public struct TagsBrowserView {
    // MARK: Variables
    var tags: [Tag]

    // MARK: Initializers
    public init(_ tags: [Tag]) {
        self.tags = tags
    }
}

// MARK: Self: HTML.View
extension TagsBrowserView: HTML.View {
    public var body: some HTML.View {
        h1 { "Browse all tags" }
        TagsListView(tags) { tag in
            li {
                TagView(tag)
            }
            .class(.tag)
        }
        .class(.tagBrowser)
    }
}

// MARK: CSS Classes (EX)
public extension SwiftHTML.Class {
    static var tag: Self { "tag" }
    internal static var tagBrowser: Self { "tag-browser" }
}
