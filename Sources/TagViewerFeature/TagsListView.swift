//
//  TagListView.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Elementary
import Models

/// Component that displays a list of tags.
public struct TagsListView<Content: HTML> {
    /// List of tags to be displayed.
    var tags: [Tag]
    /// HTML wrapper for a tag.
    var content: (Tag) -> Content
    // MARK: Initializers
    /// A description
    /// - Parameters:
    ///   - tags: List of tags to be displayed.
    ///   - content: HTML wrapper for a tag.
    ///
    /// If no HTML wrapper is passed, tags are displayed as links.
    public init(
        _ tags: [Tag],
        @HTMLBuilder content: @escaping (Tag) -> Content = TagView.init
    ) {
        self.tags = tags
        self.content = content
    }
}

// MARK: Self: HTML
extension TagsListView: HTML {
    // swiftlint:disable:next missing_docs
    public var body: some HTML {
        ul(.class(.tag)) {
            for tag in tags {
                li { content(tag) }
            }
        }
    }
}

// MARK: Previews
#if DEBUG && canImport(SwiftUI)
import Styleguide
import SwiftUI

#Preview {
    DebugHTML {
        TagsListView([
            Tag("science", url: .init(string: "/science")!),
            Tag("gym", url: .init(string: "/gym")!),
            Tag("pop", url: .init(string: "/pop")!)
        ]) {
            "Hello, \($0.name)!"
        }
    }
}
#endif
