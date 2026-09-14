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

// MARK: ArtsBlueprintsCodeWebsite (EX)
fileprivate extension ArtsBlueprintsCodeWebsite {
    var allPosts: Writer<Post.Metadata> {
        .listHTML { context in
            createPage(section: .posts) {
                PostsListView(context.items.map(Post.init))
            }
        }
    }

    var homePage: Writer<Post.Metadata> {
        .listWriter({ context in
            createPage {
                HomePageScreen(posts: context.items.map(Post.init))
            }.renderFormatted()
        }, output: "../index.html")
    }

    var postDetails: Writer<Post.Metadata> {
        .itemHTML { context in
            createPage {
                PostDetailsView(Post(context.item))
            }
        }
    }

    var rssFeed: Writer<Post.Metadata> {
        .listWriter(
            Saga.atomFeed(
                title: name,
                author: author,
                baseURL: url,
                summary: \.metadata.description,
                dateKeyPath: \.lastUpdateDate
            ),
            output: "../feed.rss"
        )
    }
}

// MARK: Item (EX)
public extension Item where M == Post.Metadata {
    var publishDate: Date { .fromString(metadata.created ?? "") ?? created }
    var lastUpdateDate: Date { .fromString(metadata.modified ?? "") ?? lastModified }
}

// MARK: Post (EX)
public extension Post {
    /// Creates a post from the metadata.
    /// - Parameter item: Metadata obtained.
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
                website.postDetails,
                website.allPosts,
                website.homePage,
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
