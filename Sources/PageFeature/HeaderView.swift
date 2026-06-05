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

/// Component that describes a common header for the website.
public struct HeaderView {
    // MARK: Variables
    /// Title of the header.
    /// 
    /// Generally, this is the website's name.
    var title: String
    /// Description of the header.
    /// 
    /// Generally, this is the website's slogan.
    var description: String
    /// Current state of the navigation bar.
    var sectionModel: WebsiteSectionsListViewModel
    // MARK: Initializers
    /// Creates a new header.
    /// - Parameters:
    ///   - title: Title of the header.
    ///   - description: Description of the header.
    ///   - model: Current state of the navigation bar.
    ///
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
    // swiftlint:disable:next missing_docs
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

// MARK: Previews
#if DEBUG && canImport(SwiftUI)
import Styleguide
import SwiftUI

#Preview("Selected") {
    DebugHTML {
        HeaderView(
            title: "My Website",
            description: "A website for posting stuff to",
            model: .init(WebsiteSection.allCases, selected: .posts)
        )
    }
}

#Preview("Unselected") {
    DebugHTML {
        HeaderView(
            title: "My Website",
            description: "A website for posting stuff to",
            model: .init(WebsiteSection.allCases, selected: nil)
        )
    }
}
#endif
