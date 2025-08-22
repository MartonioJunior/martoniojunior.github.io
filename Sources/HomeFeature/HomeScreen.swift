//
//  HomeScreen.swift
//  Website
//
//  Created by Martônio Júnior on 19/08/2025.
//

import Plot
import PostsFeature

public struct HomeScreen {
    // MARK: Variables
    var title: String
    var posts: [Post]

    // MARK: Initializers
    public init(_ title: String, posts: [Post]) {
        self.title = title
        self.posts = posts
    }
}

// MARK: Self: Component
extension HomeScreen: Component {
    @ComponentBuilder
    public var body: Component {
        Div {
            if !title.isEmpty { H1(title) }
            H1("What's new?")
            PostsListView(posts)
        }
    }
}
