//
//  TagView.swift
//  Website
//
//  Created by Martônio Júnior on 19/08/2025.
//

import Elementary
import Models

/// Component that display a tag as a link.
public struct TagView {
    // MARK: Variables
    /// Tag to be displayed.
    var tag: Tag
    // MARK: Initializers
    /// Creates a new tag display.
    /// - Parameter tag: Tag to be displayed.
    public init(_ tag: Tag) {
        self.tag = tag
    }
}

// MARK: Self: HTML
extension TagView: HTML {
    // swiftlint:disable:next missing_docs
    public var body: some HTML {
        a(.href(tag.url.relativePath)) { tag.name }
    }
}

// MARK: Previews
#if DEBUG && canImport(SwiftUI)
import Styleguide
import SwiftUI

#Preview {
    DebugHTML {
        TagView(Tag("food", url: .init(string: "/food")!))
    }
}
#endif
