//
//  Saga+AreasFeature.swift
//  Website
//
//  Created by Martônio Júnior on 20/10/2025.
//

import Elementary
import Models
import NavigationFeature
import Saga
import Styleguide

public extension Saga {
    func registerAreas(_ website: ArtsBlueprintsCodeWebsite) throws -> Self {
        try registerAreas(website) {
            return switch $0 {
                case .about, .contact, .posts:
                    EmptyView()
                default:
                    EmptyView()
            }
        }
    }

    func registerAreas(
        _ website: ArtsBlueprintsCodeWebsite,
        content: @escaping (WebsiteSection) -> some HTML
    ) -> Self {
        let htmlWriter = parseHTML(Section.Metadata.self) { context in
            let section = context.item.metadata.section

            return website.bake(selected: section) {
                WebsiteSectionScreen(section) {
                    HTMLRaw(context.item.body)
                    content(section)
                }
            }
        }

        let rerouteToIndex: @Sendable (Item<Section.Metadata>) -> Void = {
            var components = $0.relativeDestination.components
            components.removeFirst()
            $0.relativeDestination = .init(components: components)
        }

        return register(
            folder: "index",
            metadata: WebsiteSection.Metadata.self,
            readers: [.customMarkdownRenderer()],
            itemProcessor: rerouteToIndex,
            writers: [.itemWriter(htmlWriter)]
        )
    }
}

extension Section.Metadata: Metadata {}
