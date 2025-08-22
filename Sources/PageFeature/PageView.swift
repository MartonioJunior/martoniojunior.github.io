//
//  PageView.swift
//  Website
//
//  Created by Martônio Júnior on 19/08/2025.
//

import AreasFeature
import CSS
import Plot

public struct PageView {
    // MARK: Variables
    var title: String
    var description: String
    var navigation: WebsiteAreasListView.Model
    var content: () -> Component

    // MARK: Initializers
    public init(
        _ title: String,
        description: String,
        navigation: WebsiteAreasListView.Model,
        @ComponentBuilder content: @escaping () -> Component
    ) {
        self.title = title
        self.description = description
        self.navigation = navigation
        self.content = content
    }
}

// MARK: Self: Component
extension PageView: Component {
    @ComponentBuilder
    public var body: Component {
        HeaderView(
            title: title,
            description: description,
            model: navigation
        )
        content().apply(.wrapper)
        FooterView()
    }
}
