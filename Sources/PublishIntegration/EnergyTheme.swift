//
//  Energy.swift
//  Website
//
//  Created by Martônio Júnior on 24/06/25.
//

import AreasFeature
import HomeFeature
import HTML
import Plot
import PageFeature
import PostsFeature
import Publish
import TagViewerFeature

public struct Energy {}

// MARK: Energy.HTMLFactory
public extension Energy {
    struct HTMLFactory<Site: Publish.Website> where Site.SectionID: Sendable {
        let styleSheetPaths: [Publish.Path] = [
            "EnergyTheme/styles.css",
            "EnergyTheme/code.css"
        ]
    }
}

extension Energy.HTMLFactory: Publish.HTMLFactory {
    // MARK: Index
    public func makeIndexHTML(for index: Publish.Index, context: Publish.PublishingContext<Site>) throws -> Plot.HTML {
        HTML(
            .lang(context.site.language),
            .head(for: index, on: context.site, stylesheetPaths: styleSheetPaths),
            .body {
                // PageDocument(context) {
                //     HomePageScreen(
                //         index.title,
                //         posts: context.allItems(
                //             sortedBy: \.date,
                //             order: .descending
                //         ).remap(using: context.site)
                //     )
                // }
            }
        )
    }

    // MARK: Section Index
    public func makeSectionHTML(
        for section: Publish.Section<Site>,
        context: Publish.PublishingContext<Site>
    ) throws -> Plot.HTML {
        HTML(
            .lang(context.site.language),
            .head(for: section, on: context.site, stylesheetPaths: styleSheetPaths),
            .body {
                PageDocument(context, section: section.id) {
                    div {
                        if section.content.body.isEmpty {
                            if let area = WebsiteArea(section.id) {
                                h1 { area.title }
                            }
                            PostsListView(section.items.remap(using: context.site).sorted(by: {
                                $0.date > $1.date
                            }))
                        } else {
                            section.content.body.html
                        }
                    }
                }
            }
        )
    }

    // MARK: Item
    public func makeItemHTML(
        for item: Publish.Item<Site>,
        context: Publish.PublishingContext<Site>
    ) throws -> Plot.HTML {
        HTML(
            .lang(context.site.language),
            .head(for: item, on: context.site, stylesheetPaths: styleSheetPaths),
            .body(
                // .apply(.post),
                .components {
                    PageDocument(context, section: item.sectionID) {
                        PostDetailsView(Post(item, site: context.site))
                    }
                }
            )
        )
    }

    // MARK: Page
    public func makePageHTML(for page: Publish.Page, context: Publish.PublishingContext<Site>) throws -> Plot.HTML {
        guard !page.isTemplate else { throw PublishingError.blockPublish(of: page) }

        return HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site, stylesheetPaths: styleSheetPaths),
            .body {
                PageDocument(context) {
                    page.body.html
                }
            }
        )
    }

    // MARK: Tag List
    public func makeTagListHTML(
        for page: Publish.TagListPage,
        context: Publish.PublishingContext<Site>
    ) throws -> Plot.HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site, stylesheetPaths: styleSheetPaths),
            .body {
                PageDocument(context) {
                    TagsBrowserView(page.tags.sorted().remap(using: context.site))
                }
            }
        )
    }

    // MARK: Tag Details
    public func makeTagDetailsHTML(
        for page: Publish.TagDetailsPage,
        context: Publish.PublishingContext<Site>
    ) throws -> Plot.HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site, stylesheetPaths: styleSheetPaths),
            .body {
                PageDocument(context) {
                    TagPostsListView(
                        tag: .init(tag: page.tag, site: context.site),
                        posts: context.items(
                            taggedWith: page.tag,
                            sortedBy: \.date,
                            order: .descending
                        ).remap(using: context.site)
                    )
                }
            }
        )
    }
}

// MARK: Theme (EX)
public extension Theme where Site.SectionID: Sendable {
    static var energy: Self {
        .init(
            htmlFactory: Energy.HTMLFactory()
        )
    }
}
