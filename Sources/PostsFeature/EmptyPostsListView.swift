//
//  EmptyPostsListView.swift
//  ProjectName
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Plot

public struct EmptyPostsListView {
    public init() {}
}

// MARK: Self: Component
extension EmptyPostsListView: Component {
    public var body: Component {
        Div {
            Paragraph("Nothing to see here...")
        }
    }
}
