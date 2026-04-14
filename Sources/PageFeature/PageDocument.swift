//
//  PageDocument.swift
//  Website
//
//  Created by Martônio Júnior on 19/08/2025.
//

import Elementary
import Foundation
import Models
import NavigationFeature
import Styleguide

public struct PageDocument<Content: HTML> {
    // MARK: Variables
    public var title: String
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

// MARK: Self: HTML.Document
extension PageDocument: HTMLDocument {
    public var head: some HTML {
        Elementary.title { title }
        meta(.charset(.utf8))
        CSSTheme.energyTheme.reference(subpath: "styles.css")
        CSSTheme.energyTheme.reference(subpath: "code.css")
        // lang(.americanEnglish)
    }

    public var body: some HTML {
        HeaderView(
            title: title,
            description: description,
            model: navigation
        )
        div(.class(.wrapper)) {
            content()
        }
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
