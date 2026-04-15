//
//  HomePageScreen.swift
//  Website
//
//  Created by Martônio Júnior on 19/08/2025.
//

import Elementary
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

// MARK: Self: HTML
extension HomePageScreen: HTML {
    public var body: some HTML {
        WebsiteSectionScreen {
            PostsListView(latestPosts)
        }
    }
}

// MARK: Previews
#if DEBUG && canImport(SwiftUI)
import SwiftUI
import Styleguide

#Preview {
    DebugHTML {
        HomePageScreen(posts: repeatElement(.preview, count: 6).map(\.self))
    }
}

#endif
