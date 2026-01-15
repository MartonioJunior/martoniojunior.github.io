//
//  Saga+AreasFeature.swift
//  Website
//
//  Created by Martônio Júnior on 20/10/2025.
//

import HTML
import Models
import NavigationFeature
import Saga
import Styleguide

public extension Saga {
    func registerAreas(_ website: ArtsBlueprintsCodeWebsite) throws -> Self {
        try registerAreas(website) {
            switch $0 {
                case .about, .contact, .posts:
                    AnyHTML { }
                default:
                    AnyHTML { EmptyView() }
            }
        }
    }

    func registerAreas(
        _ website: ArtsBlueprintsCodeWebsite,
        content: @escaping (WebsiteSection) -> some HTML.View
    ) throws -> Self {
        let htmlWriter = html(WebsiteAreaMetadata.self) { context in
            let section = context.item.metadata.section

            return website.bake(selected: section) {
                WebsiteSectionScreen(section) {
                    HTML.Raw(context.item.body)
                    content(section)
                }
            }
        }

        let rerouteToIndex: (Item<WebsiteAreaMetadata>) -> Void = {
            var components = $0.relativeDestination.components
            components.removeFirst()
            $0.relativeDestination = .init(components: components)
        }

        return try register(
            folder: "index",
            metadata: WebsiteSection.Metadata.self,
            readers: [.parsleyMarkdownReader],
            itemProcessor: rerouteToIndex,
            writers: [.itemWriter(htmlWriter)]
        )
    }
}

extension WebsiteAreaMetadata: Metadata {}
