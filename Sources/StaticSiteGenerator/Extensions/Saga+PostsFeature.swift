//
//  Saga+PostsFeature.swift
//  Website
//
//  Created by Martônio Júnior on 14/10/2025.
//

import Elementary
import Foundation
import HomeFeature
import Models
import PostViewerFeature
import Saga

// MARK: Item (EX)
public extension Item where M == Post.Metadata {
    var publishDate: Date { Date.websiteParse(metadata.created ?? "") ?? created }
    var lastUpdateDate: Date { Date.websiteParse(metadata.modified ?? "") ?? lastModified }
}

// MARK: Post (EX)
public extension Post {
    init(_ item: Item<Metadata>) {
        self.init(
            title: item.title,
            summary: item.metadata.description ?? "",
            created: item.publishDate,
            modified: item.lastUpdateDate,
            url: URL(string: item.url)!
        ) {
            HTMLRaw(item.body)
        }
    }

    static func preprocessor(for item: Item<Metadata>) {
        item.title = item.metadata.title.isEmpty ? item.title : item.metadata.title
    }

    static func writer(_ context: ItemRenderingContext<Metadata>) -> PostDetailsView {
        PostDetailsView(Post(context.item))
    }

    static func listWriter(_ context: ItemsRenderingContext<Metadata>) -> some HTML {
        PostsListView(context.items.map(Self.init))
    }
}

extension Post.Metadata: Metadata {}

// MARK: Saga (EX)
public extension Saga {
    func registerPosts(
        _ website: ArtsBlueprintsCodeWebsite
    ) -> Self {
        register(
            folder: "posts",
            metadata: Post.Metadata.self,
            readers: [.customMarkdownRenderer()],
            itemProcessor: Post.preprocessor,
            filter: \.metadata.published,
            writers: [
                .itemHTML(Post.writer),
                .listHTML { context in
                    website.createPage(section: .posts) {
                        Post.listWriter(context)
                    }
                },
                .listWriter({ context in
                    website.createPage {
                        HomePageScreen(posts: context.items.map(Post.init))
                    }.renderFormatted()
                }, output: "../index.html"),
                .listWriter(
                    Self.atomFeed(
                        title: website.name,
                        author: website.author,
                        baseURL: website.url,
                        summary: \.metadata.description,
                        dateKeyPath: \.lastUpdateDate
                    ),
                    output: "../feed.rss"
                )
            ]
        )
    }
}
