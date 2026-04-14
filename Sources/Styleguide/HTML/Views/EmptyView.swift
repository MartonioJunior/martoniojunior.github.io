//
//  EmptyView.swift
//  ProjectName
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Elementary

public struct EmptyView {
    public init() {}
}

// MARK: Self: HTML.View
extension EmptyView: HTML {
    public var body: some HTML {
        div {
            p { "There's nothing here yet..." }
        }
    }
}
