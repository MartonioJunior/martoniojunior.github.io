//
//  Saga+PostsFeature.swift
//  Website
//
//  Created by Martônio Júnior on 14/10/2025.
//

import Foundation
import HomeFeature
import HTML
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
            HTML.Raw(item.body)
        }
    }

    static func preprocessor(for item: Item<Metadata>) {
        item.title = item.metadata.title.isEmpty ? item.title : item.metadata.title
    }

    static func writer(_ context: ItemRenderingContext<Metadata>) -> some HTML.View {
        PostDetailsView(Post(context.item))
    }

    static func listWriter(_ context: ItemsRenderingContext<Metadata>) -> some HTML.View {
        PostsListView(context.items.map(Post.init))
    }
}

extension PostMetadata: Metadata {}

// MARK: Saga (EX)
public extension Saga {
    func registerPosts(
        _ website: ArtsBlueprintsCodeWebsite
    ) throws -> Self {
        try register(
            folder: "posts",
            metadata: Post.Metadata.self,
            readers: [.customMarkdownRenderer(for: .website)],
            itemProcessor: Post.preprocessor,
            filter: \.metadata.isPublic,
            writers: [
                .itemWriter(html(Post.Metadata.self, website, Post.writer)),
                .listWriter(htmlMany(Post.Metadata.self, website, selected: .posts, Post.listWriter)),
                .listWriter(htmlMany(Post.Metadata.self, website) {
                    HomePageScreen(posts: $0.items.map(Post.init))
                }, output: "../index.html"),
                .listWriter(
                    atomFeed(
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
