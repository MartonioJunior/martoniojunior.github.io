//
//  EmptyView.swift
//  ProjectName
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Elementary

/// Describes a HTML container with no items available.
public struct EmptyView {
    /// Creates a new empty container.
    public init() {}
}

// MARK: Self: HTML.View
extension EmptyView: HTML {
    // swiftlint:disable:next missing_docs
    public var body: some HTML {
        div {
            p { "There's nothing here yet..." }
        }
    }
}

// MARK: Previews
#if DEBUG && canImport(SwiftUI)
import SwiftUI

#Preview {
    DebugHTML {
        EmptyView()
    }
}
#endif
