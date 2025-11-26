//
//  Publish+AreasFeature.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import AreasFeature
import Publish

// MARK: WebsiteArea (EX)
public extension WebsiteArea {
    init?<ID: WebsiteSectionID>(_ section: ID?) {
        guard let section else { return nil }

        self.init(rawValue: section.rawValue)
    }
}

public extension Set where Element == WebsiteArea {
    static var rssSections: Self { .init([.posts]) }
}

// MARK: WebsiteAreasListView.Model (EX)
public extension WebsiteAreasListView.Model {
    init<ID: WebsiteSectionID & Sendable>(_ sections: [ID], selected: ID? = nil) {
        self.init(
            sections.compactMap(WebsiteArea.init),
            selected: WebsiteArea(selected)
        )
    }
}
