//
//  WebsiteSectionBadge.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import HTML
import Models
import Styleguide

public struct WebsiteSectionBadge {
    // MARK: Variables
    var area: WebsiteSection

    // MARK: Initializers
    public init(_ area: WebsiteSection) {
        self.area = area
    }
}

// MARK: Self: HTML.View
extension WebsiteSectionBadge: HTML.View {
    public var body: some HTML.View {
        a(href: .init(area.url.relativePath)) { area.title }
    }
}
