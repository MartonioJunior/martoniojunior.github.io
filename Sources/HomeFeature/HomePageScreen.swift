//
//  HomePageScreen.swift
//  Website
//
//  Created by Martônio Júnior on 19/08/2025.
//

import HTML
import PageFeature
import Models
import NavigationFeature
import PostViewerFeature
import Settings

public struct HomePageScreen {
    // MARK: Variables
    var latestPosts: [Post]

    // MARK: Initializers
    public init(
        posts: [Post]
    ) {
        self.latestPosts = posts
    }
}

// MARK: Self: HTMLComponent
extension HomePageScreen: HTMLComponent {
    public var body: some HTMLComponent {
        WebsiteSectionScreen {
            PostsListView(latestPosts)
        }
    }
}
