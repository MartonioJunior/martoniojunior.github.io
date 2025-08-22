//
//  TagsBrowserView.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import CSS
import Plot

// TODO: Transform Tag Browsing into it's own module
public struct TagsBrowserView {
    // MARK: Variables
    var tags: [Tag]

    // MARK: Initializers
    public init(_ tags: [Tag]) {
        self.tags = tags
    }
}

// MARK: Self: Component
extension TagsBrowserView: Component {
    @ComponentBuilder
    public var body: Component {
        H1("Browse all tags")
        TagsListView(tags) { tag in
            ListItem {
                TagView(tag)
            }
            .apply(.tag)
        }
        .apply(.tagBrowser)
    }
}

// MARK: CSSClass (EX)
public extension CSSClass {
    static var tag: Self { "tag" }
    internal static var tagBrowser: Self { "tag-browser" }
}
