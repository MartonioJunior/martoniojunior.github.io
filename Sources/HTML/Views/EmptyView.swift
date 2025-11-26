//
//  EmptyView.swift
//  ProjectName
//
//  Created by Martônio Júnior on 20/08/2025.
//

public struct EmptyView {
    public init() {}
}

// MARK: Self: HTMLComponent
extension EmptyView: HTMLComponent {
    public var body: some HTMLComponent {
        div {
            p { "There's nothing here yet..." }
        }
    }
}
