//
//  WebsiteSectionBadge.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import HTML
import Models

public struct WebsiteSectionBadge {
    // MARK: Variables
    var area: WebsiteSection

    // MARK: Initializers
    public init(_ area: WebsiteSection) {
        self.area = area
    }
}

// MARK: Self: HTMLComponent
extension WebsiteSectionBadge: HTMLComponent {
    public var body: some HTMLComponent {
        a(href: .init(area.url)) { area.title }
    }
}
