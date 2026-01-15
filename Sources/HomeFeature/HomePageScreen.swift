//
//  HomePageScreen.swift
//  Website
//
//  Created by Martônio Júnior on 19/08/2025.
//

import HTML
import Models
import NavigationFeature
import PageFeature
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

// MARK: Self: HTML.View
extension HomePageScreen: HTML.View {
    public var body: some HTML.View {
        WebsiteSectionScreen {
            PostsListView(latestPosts)
        }
    }
}
