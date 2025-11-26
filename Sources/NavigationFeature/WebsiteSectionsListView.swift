//
//  WebsiteSectionsListView.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import CSS
import HTML
import Models

public struct WebsiteSectionsListView<Content: HTML> {
    // MARK: Variables
    var model: Model
    var content: (WebsiteSection) -> Content

    // MARK: Initializers
    public init(
        _ model: Model,
        @HTMLBuilder content: @escaping (WebsiteSection) -> Content = WebsiteSectionBadge.init
    ) {
        self.model = model
        self.content = content
    }

    public init(
        _ sections: [WebsiteSection],
        selected: WebsiteSection? = nil,
        @HTMLBuilder content: @escaping (WebsiteSection) -> Content = WebsiteSectionBadge.init
    ) {
        self.init(.init(sections, selected: selected), content: content)
    }
}

// MARK: Self.Model
public struct WebsiteSectionsListViewModel {
    var sections: [WebsiteSection]
    var selected: WebsiteSection?

    public var numberOfSections: Int { sections.count }

    public init(
        _ sections: [WebsiteSection],
        selected: WebsiteSection? = nil
    ) {
        self.sections = sections
        self.selected = selected
    }

    public func selecting(_ section: WebsiteSection? = nil) -> Self {
        .init(sections, selected: section)
    }

    public static var home: Self {
        .init(WebsiteSection.allCases, selected: nil)
    }
}
public extension WebsiteSectionsListView {
    typealias Model = WebsiteSectionsListViewModel
}

// MARK: Self: HTMLComponent
extension WebsiteSectionsListView: HTMLComponent {
    public var body: some HTMLComponent {
        ul {
            HTMLForEach(model.sections) { section in
                li {
                    content(section)
                }.style(css: section == model.selected ? .selected : .none)
            }
        }
    }
}
