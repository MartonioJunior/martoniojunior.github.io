//
//  PageDocument.swift
//  Website
//
//  Created by Martônio Júnior on 19/08/2025.
//

import CSS
import Foundation
import HTML
import Models
import NavigationFeature

public struct PageDocument<Content: HTML> {
    // MARK: Variables
    var title: String
    var description: String
    var navigation: WebsiteSectionsListViewModel
    var content: () -> Content

    // MARK: Initializers
    public init(
        _ title: String,
        description: String,
        navigation: WebsiteSectionsListViewModel = .home,
        @HTMLBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.description = description
        self.navigation = navigation
        self.content = content
    }
}

// MARK: Self: HTMLDoc
extension PageDocument: HTMLDoc {
    public var head: some HTMLComponent {
        SwiftHTML.title { title }
        meta(charset: .utf8)()
        Link.css(from: .energyTheme, path: "styles.css")
        Link.css(from: .energyTheme, path: "code.css")
        // lang(.americanEnglish)
    }

    public var body: some HTMLComponent {
        HeaderView(
            title: title,
            description: description,
            model: navigation
        )
        div {
            content()
        }.style(css: .wrapper)
        FooterView()
        KaTeX()
        HighlightJS()
    }
}

// MARK: ArtsBlueprintsCodeWebsite (EX)
public extension ArtsBlueprintsCodeWebsite {
    func createPage<Content: HTML>(
        @HTMLBuilder content: @escaping () -> Content
    ) -> PageDocument<Content> {
        .init(name, description: description, content: content)
    }
}
