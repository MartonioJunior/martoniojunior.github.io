//
//  Header.swift
//  Website
//
//  Created by Martônio Júnior on 24/06/25.
//

import CSS
import HTML
import Models
import NavigationFeature

public struct HeaderView {
    // MARK: Variables
    var title: String
    var description: String
    var sectionModel: WebsiteSectionsListViewModel

    // MARK: Initializers
    public init(
        title: String,
        description: String,
        model: WebsiteSectionsListViewModel
    ) {
        self.title = title
        self.description = description
        self.sectionModel = model
    }
}

// MARK: Self: HTMLComponent
extension HeaderView: HTMLComponent {
    public var body: some HTMLComponent {
        header {
            div {
                a(href: "/") { title }.style(css: .websiteTitle)
                p { description }.style(css: .description)
                p { "Website still in development..." }.style(css: .workInProgress)
                if sectionModel.numberOfSections > 1 {
                    nav {
                        WebsiteSectionsListView(sectionModel)
                    }
                }
            }
            .style(css: .wrapper)
        }
    }
}

// MARK: CSSClass (EX)
extension SwiftHTML.Class {
    static var websiteTitle: Self { "site-name" }
}
