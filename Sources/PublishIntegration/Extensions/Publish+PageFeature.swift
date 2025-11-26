//
//  Publish+PageFeature.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import HTML
import Plot
import Publish
import PageFeature

// MARK: Page (EX)
public extension Publish.Page {
    var isTemplate: Bool {
        path.absoluteString.hasPrefix("/templates/")
    }
}

// MARK: PageView (EX)
public extension PageDocument {
    init<Site: Website>(
        _ context: PublishingContext<Site>,
        section: Site.SectionID? = nil,
        @HTMLBuilder content: @escaping () -> Content
    ) where Site.SectionID: Sendable {
        self.init(
            context.site.name,
            description: context.site.description,
            navigation: .init(context.sections.ids.map(\.self), selected: section),
            content: content
        )
    }
}

extension PageDocument: Plot.Component {
    public var body: any Plot.Component {
        Text(render())
    }
}

// MARK: PublishingError (EX)
public extension PublishingError {
    static func blockPublish(of page: Publish.Page) -> Self {
        .init(infoMessage: "The page \(page.title) at \(page.path) should not be published!")
    }
}
