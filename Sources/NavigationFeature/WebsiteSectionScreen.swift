//
//  WebsiteSectionScreen.swift
//  Website
//
//  Created by Martônio Júnior on 14/10/2025.
//

import HTML
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

// MARK: Self: HTMLComponent
extension WebsiteSectionScreen: HTMLComponent {
    public var body: some HTMLComponent {
        div {
            h1 { area?.title ?? "What's new?" }
            content()
        }
    }
}
