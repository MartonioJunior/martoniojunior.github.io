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
import Styleguide

public struct PageDocument<Content: HTML.View> {
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
        @HTML.Builder content: @escaping () -> Content
    ) {
        self.title = title
        self.description = description
        self.navigation = navigation
        self.content = content
    }
}

// MARK: Self: HTML.DocumentProtocol
extension PageDocument: HTML.DocumentProtocol {
    public var head: some HTML.View {
        Title { title }
        Meta(charset: .utf8)
        CSSTheme.energyTheme.reference(subpath: "styles.css")
        CSSTheme.energyTheme.reference(subpath: "code.css")
        // lang(.americanEnglish)
    }

    public var body: some HTML.View {
        HeaderView(
            title: title,
            description: description,
            model: navigation
        )
        div {
            content()
        }.class(.wrapper)
        FooterView()
        KaTeX()
        HighlightJS()
    }
}

// MARK: ArtsBlueprintsCodeWebsite (EX)
public extension ArtsBlueprintsCodeWebsite {
    func createPage<Content: HTML.View>(
        @HTML.Builder content: @escaping () -> Content
    ) -> PageDocument<Content> {
        .init(name, description: description, content: content)
    }
}
