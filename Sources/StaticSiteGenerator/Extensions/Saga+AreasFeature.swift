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
    func registerAreas(_ website: ArtsBlueprintsCodeWebsite) -> Self {
        registerAreas(of: website, content: \.indexHTML)
    }

    func registerAreas(
        of website: ArtsBlueprintsCodeWebsite,
        content: @escaping @Sendable (WebsiteSection) -> some HTML
    ) -> Self {
        register(
            folder: "index",
            metadata: WebsiteSection.Metadata.self,
            readers: [.customMarkdownRenderer()],
            itemProcessor: { $0.rerouteToIndex() },
            writers: [
                .itemHTML { context in
                    let section = context.item.metadata.section

                    return website.createPage(section: section) {
                        WebsiteSectionScreen(section) {
                            HTMLRaw(context.item.body)
                            content(section)
                        }
                    }
                }
            ]
        )
    }
}

extension Item where M == Section.Metadata {
    func rerouteToIndex() {
        var components = relativeDestination.components
        components.removeFirst()
        relativeDestination = .init(components: components)
    }
}

extension Section {
    /// HTML applied to each section's index page.
    var indexHTML: some HTML {
        switch self {
            case .about, .contact, .posts:
                EmptyView()
            default:
                EmptyView()
        }
    }
}

extension Section.Metadata: Metadata {}
