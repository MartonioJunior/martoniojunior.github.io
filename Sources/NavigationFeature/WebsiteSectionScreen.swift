//
//  WebsiteSectionScreen.swift
//  Website
//
//  Created by Martônio Júnior on 14/10/2025.
//

import Elementary
import Models

public typealias WebsiteSection = Models.Section

public struct WebsiteSectionScreen<Content: HTML> {
    // MARK: Variables
    var area: WebsiteSection?
    @HTMLBuilder var content: () -> Content

    // MARK: Initializers
    public init(
        _ area: WebsiteSection? = nil,
        @HTMLBuilder content: @escaping () -> Content
    ) {
        self.area = area
        self.content = content
    }
}

// MARK: Self: HTML
extension WebsiteSectionScreen: HTML {
    public var body: some HTML {
        div {
            h1 { area?.title ?? "What's new?" }
            content()
        }
    }
}

// MARK: Previews
#if DEBUG && canImport(SwiftUI)
import SwiftUI
import Styleguide

#Preview {
    DebugHTML {
        WebsiteSectionScreen {
            "Hello, World!"
        }
    }
}

#endif
