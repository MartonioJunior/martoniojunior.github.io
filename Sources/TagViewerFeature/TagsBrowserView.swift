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
/// Component used to show a list of tags used in the website.
public struct TagsBrowserView {
    // MARK: Variables
    /// List of tags to be displayed.
    var tags: [Tag]
    // MARK: Initializers
    /// Creates a new tag browser.
    /// - Parameter tags: List of tags to be displayed.
    public init(_ tags: [Tag]) {
        self.tags = tags
    }
}

// MARK: Self: HTML
extension TagsBrowserView: HTML {
    // swiftlint:disable:next missing_docs
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
    static var tag: Self { #function }
    internal static var tagBrowser: Self { "tag-browser" }
}

// MARK: Previews
#if DEBUG && canImport(SwiftUI)
import Styleguide
import SwiftUI

#Preview {
    DebugHTML {
        TagsBrowserView([
            Tag("Goals", url: .init(string: "/goals")!),
            Tag("Lifestyle", url: .init(string: "/lifestyle")!),
            Tag("Soccer", url: .init(string: "/soccer")!),
            Tag("Technology", url: .init(string: "/technology")!)
        ])
    }
}
#endif
