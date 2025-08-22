//
//  Publish+PageFeature.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Plot
import Publish
import PageFeature

// MARK: PageView (EX)
public extension PageView {
    init<Site: Website>(
        _ context: PublishingContext<Site>,
        section: Site.SectionID? = nil,
        @ComponentBuilder content: @escaping () -> Component
    ) {
        self.init(
            context.site.name,
            description: context.site.description,
            navigation: .init(context.sections.ids.map(\.self), selected: section),
            content: content
        )
    }
}
