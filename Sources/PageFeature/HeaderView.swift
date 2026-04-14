//
//  Header.swift
//  Website
//
//  Created by Martônio Júnior on 24/06/25.
//

import Elementary
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

// MARK: Self: HTML
extension HeaderView: HTML {
    public var body: some HTML {
        header {
            div(.class(.wrapper)) {
                a(.href("/"), .class(.websiteTitle)) { title }
                p(.class(.description)) { description }
                p(.class(.workInProgress)) { "Website still in development..." }
                if sectionModel.numberOfSections > 1 {
                    nav {
                        WebsiteSectionsListView(sectionModel)
                    }
                }
            }
        }
    }
}

// MARK: CSSClass (EX)
extension Class {
    static var websiteTitle: Self { "site-name" }
}
