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
import SagaParsleyMarkdownReader

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
    /// Date when the article was first published.
    var publishDate: Date { .fromString(metadata.created ?? "") ?? created }
    /// Date when the article was last updated
    var lastUpdateDate: Date { .fromString(metadata.modified ?? "") ?? lastModified }
    /// Checks whether an item can be deployed to the build.
    /// - Parameters:
    ///   - referenceDate: Date of reference. By default, uses `Date.now`.
    ///   - override: Set this to `true` to override any validation.
    ///
    func canDeploy(onDate referenceDate: Date = .now, override: Bool = Saga.isDev) -> Bool {
        override || isPublic(onDate: referenceDate)
    }
    /// Checks whether an item is public by a certain date.
    /// - Parameter referenceDate: Date of reference. By default, uses `Date.now`.
    /// - Returns: `true` when the post should be public, `false` otherwise
    func isPublic(onDate referenceDate: Date = .now) -> Bool {
        metadata.published && publishDate <= referenceDate
    }
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

        if !item.metadata.published { item.title = "📝 WIP: \(item.title)" }
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
            readers: [.parsleyMarkdownReader],
            itemProcessor: Post.preprocessor,
            filter: { $0.canDeploy() },
            writers: [
                website.postDetails,
                website.allPosts,
                website.homePage,
                website.rssFeed
            ]
        )
    }
}
