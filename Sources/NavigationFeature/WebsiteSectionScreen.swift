//
//  WebsiteSectionScreen.swift
//  Website
//
//  Created by Martônio Júnior on 14/10/2025.
//

import HTML
import Models

public typealias WebsiteSection = Models.Section

public struct WebsiteSectionScreen<Content: HTML.View> {
    // MARK: Variables
    var area: WebsiteSection?
    @HTML.Builder var content: () -> Content

    // MARK: Initializers
    public init(
        _ area: WebsiteSection? = nil,
        @HTML.Builder content: @escaping () -> Content
    ) {
        self.area = area
        self.content = content
    }
}

// MARK: Self: HTML.View
extension WebsiteSectionScreen: HTML.View {
    public var body: some HTML.View {
        div {
            h1 { area?.title ?? "What's new?" }
            content()
        }
    }
}
