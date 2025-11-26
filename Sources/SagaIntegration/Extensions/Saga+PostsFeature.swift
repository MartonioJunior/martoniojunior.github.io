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

// MARK: Post (EX)
public extension Post {
    init(_ item: Item<Metadata>) {
        let postDescription = item.metadata.description ?? ""

        self.init(
            title: item.title,
            summary: postDescription,
            created: item.created,
            modified: item.lastModified,
            url: URL(string: item.url)!
        ) {
            HTMLRaw(item.body)
        }
    }

    static func preprocessor(for item: Item<Metadata>) {
        item.title = item.metadata.title.isEmpty ? item.title : item.metadata.title
    }

    static func writer(_ context: ItemRenderingContext<Metadata>) throws -> some HTMLComponent {
        PostDetailsView(Post(context.item))
    }

    static func listWriter(_ context: ItemsRenderingContext<Metadata>) throws -> some HTMLComponent {
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
            readers: [.parsleyMarkdownReader],
            itemProcessor: Post.preprocessor,
            filter: { $0.metadata.isPublic },
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
                        dateKeyPath: \.lastModified
                    ),
                    output: "../feed.rss"
                )
            ]
        )
    }
}
