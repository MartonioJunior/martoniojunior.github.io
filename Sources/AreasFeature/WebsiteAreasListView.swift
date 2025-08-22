//
//  WebsiteAreasListView.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import CSS
import Plot

public struct WebsiteAreasListView {
    // MARK: Variables
    var model: Model
    var content: (WebsiteArea) -> Component

    // MARK: Initializers
    public init(
        _ model: Model,
        @ComponentBuilder content: @escaping (WebsiteArea) -> Component = WebsiteAreaRow.init
    ) {
        self.model = model
        self.content = content
    }

    public init(
        _ sections: [WebsiteArea],
        selected: WebsiteArea? = nil,
        @ComponentBuilder content: @escaping (WebsiteArea) -> Component = WebsiteAreaRow.init
    ) {
        self.init(.init(sections, selected: selected), content: content)
    }
}

// MARK: Self.Model
public extension WebsiteAreasListView {
    struct Model {
        var sections: [WebsiteArea]
        var selected: WebsiteArea?

        public var numberOfSections: Int { sections.count }

        public init(
            _ sections: [WebsiteArea],
            selected: WebsiteArea? = nil
        ) {
            self.sections = sections
            self.selected = selected
        }
    }
}

// MARK: Self: Component
extension WebsiteAreasListView: Component {
    @ComponentBuilder
    public var body: Component {
        List(model.sections) { section in
            ListItem {
                content(section)
            }
            .apply(section == model.selected ? .selected : .none)
        }
    }
}
