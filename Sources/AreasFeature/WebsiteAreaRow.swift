//
//  SectionRow.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Plot

public struct WebsiteAreaRow {
    // MARK: Variables
    var area: WebsiteArea

    // MARK: Initializers
    public init(_ area: WebsiteArea) {
        self.area = area
    }
}

// MARK: Self: Component
extension WebsiteAreaRow: Component {
    @ComponentBuilder
    public var body: Component {
        Link(area.title, url: area.url)
    }
}
