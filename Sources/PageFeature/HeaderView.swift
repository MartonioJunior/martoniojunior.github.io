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
import Styleguide

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

// MARK: Self: HTML.View
extension HeaderView: HTML.View {
    public var body: some HTML.View {
        header {
            div {
                a(href: "/") { title }.class(.websiteTitle)
                p { description }.class(.description)
                p { "Website still in development..." }.class(.workInProgress)
                if sectionModel.numberOfSections > 1 {
                    nav {
                        WebsiteSectionsListView(sectionModel)
                    }
                }
            }
            .class(.wrapper)
        }
    }
}

// MARK: CSSClass (EX)
extension Class {
    static var websiteTitle: Self { "site-name" }
}
