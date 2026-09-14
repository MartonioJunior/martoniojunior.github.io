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

/// HTML document representing a complete website page.
public struct PageDocument<Content: HTML> {
    // MARK: Variables
    /// Display name of the page in the browser.
    public var title: String
    /// Slogan of the website.
    var description: String
    /// Current state of the navigation bar.
    var navigation: WebsiteSectionsListViewModel
    /// HTML content of this page.
    var content: () -> Content
    // MARK: Initializers
    /// Creates a new HTML document for the website.
    /// - Parameters:
    ///   - title: Display name of the page in the browser.
    ///   - description: Slogan of the website.
    ///   - navigation: Current state of the navigation bar.
    ///   - content: HTML content of this page.
    ///
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
    /// Header of the website.
    /// 
    /// This is part of the document to describe:
    /// - All CSS that need to be loaded.
    /// - Language of the page.
    /// - Other metadata information about the website.
    public var head: some HTML {
        Elementary.title { title }
        meta(.charset(.utf8))
        CSSTheme.energyTheme.reference(subpath: "styles.css")
        CSSTheme.energyTheme.reference(subpath: "code.css")
        // lang(.americanEnglish)
    }
    /// Body of the website.
    /// 
    /// JavaScript content must be described here, after the footer view.
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
    /// Wraps base HTML content into a properly defined page document.
    /// - Parameters:
    ///   - section: Currently selected section for the page.
    ///   - content: HTML content of a website page.
    /// - Returns: `PageDocument` instance with the associated `content`.
    func createPage<Content: HTML>(
        section: WebsiteSection? = nil,
        @HTMLBuilder content: @escaping () -> Content
    ) -> PageDocument<Content> {
        .init(
            name,
            description: description,
            navigation: .home.selecting(section),
            content: content
        )
    }
}

// MARK: Previews
#if DEBUG && canImport(SwiftUI)
import Styleguide
import SwiftUI

#Preview {
    DebugHTML {
        PageDocument("My Website", description: "A website with stuff about me") {
            "Hello, world!"
        }
    }
}
#endif
