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

/// Home Page for the website.
public struct HomePageScreen {
    // MARK: Variables
    /// List of latest posts for the website.
    var latestPosts: [Post]
    // MARK: Initializers
    /// Instances the home page.
    /// - Parameter posts: List of latest posts for the website.
    public init(
        posts: [Post]
    ) {
        self.latestPosts = posts
    }
}

// MARK: Self: HTML
extension HomePageScreen: HTML {
    // swiftlint:disable:next missing_docs
    public var body: some HTML {
        WebsiteSectionScreen {
            PostsListView(latestPosts)
        }
    }
}

// MARK: Previews
#if DEBUG && canImport(SwiftUI)
import Styleguide
import SwiftUI

#Preview {
    DebugHTML {
        HomePageScreen(posts: repeatElement(.preview, count: 6).map(\.self))
    }
}
#endif
