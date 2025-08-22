//
//  Header.swift
//  Website
//
//  Created by Martônio Júnior on 24/06/25.
//

import AreasFeature
import CSS
import Plot

public struct HeaderView {
    // MARK: Variables
    var title: String
    var description: String
    var sectionModel: WebsiteAreasListView.Model

    // MARK: Initializers
    public init(
        title: String,
        description: String,
        model: WebsiteAreasListView.Model
    ) {
        self.title = title
        self.description = description
        self.sectionModel = model
    }
}

// MARK: Self: Component
extension HeaderView: Component {
    public var body: Component {
        Header {
            Div {
                Link(title, url: "/")
                    .apply(.websiteTitle)
                Paragraph(description)
                    .apply(.description)
                Paragraph("Website still in development...")
                    .apply(.workInProgress)
                if sectionModel.numberOfSections > 1 {
                    navigation
                }
            }
            .apply(.wrapper)
        }
    }

    private var navigation: Component {
        Navigation {
            WebsiteAreasListView(sectionModel)
        }
    }
}

// MARK: CSSClass (EX)
extension CSSClass {
    static var websiteTitle: Self { "site-name" }
}
