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

// MARK: ArtsBlueprintsCodeWebsite (EX)
fileprivate extension ArtsBlueprintsCodeWebsite {
    func sectionPages(
        _ content: @escaping @Sendable (WebsiteSection) -> some HTML
    ) -> Writer<WebsiteSection.Metadata> {
        .itemHTML { context in
            let section = context.item.metadata.section

            return createPage(section: section) {
                WebsiteSectionScreen(section) {
                    HTMLRaw(context.item.body)
                    content(section)
                }
            }
        }
    }
}

// MARK: Saga (EX)
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
            readers: [.websiteDefault],
            itemProcessor: { $0.rerouteToIndex() },
            writers: [
                website.sectionPages(content)
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
                EmptyHTML().eraseToRawHTML()
            default:
                EmptyView().eraseToRawHTML()
        }
    }
}

extension Section.Metadata: Metadata {}
