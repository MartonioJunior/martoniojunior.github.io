//
//  TagView.swift
//  Website
//
//  Created by Martônio Júnior on 19/08/2025.
//

import Elementary
import Models

public struct TagView {
    // MARK: Variables
    var tag: Tag

    // MARK: Initializers
    public init(_ tag: Tag) {
        self.tag = tag
    }
}

// MARK: Self: HTML
extension TagView: HTML {
    public var body: some HTML {
        a(.href(tag.url.relativePath)) { tag.name }
    }
}

// MARK: Previews
#if DEBUG && canImport(SwiftUI)
import SwiftUI
import Styleguide

#Preview {
    DebugHTML {
        TagView(Tag("food", url: .init(string: "/food")!))
    }
}
#endif
