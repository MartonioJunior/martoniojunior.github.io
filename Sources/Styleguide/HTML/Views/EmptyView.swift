//
//  EmptyView.swift
//  ProjectName
//
//  Created by Martônio Júnior on 20/08/2025.
//

import HTML

public struct EmptyView {
    public init() {}
}

// MARK: Self: HTML.View
extension EmptyView: HTML.View {
    public var body: some HTML.View {
        div {
            p { "There's nothing here yet..." }
        }
    }
}
