//
//  DebugHTML.swift
//  Website
//
//  Created by Martônio Júnior on 14/04/26.
//

#if DEBUG && canImport(SwiftUI)
import Elementary
import SwiftUI

/// HTML wrapper for debugging purposes.
@preconcurrency
@MainActor
public struct DebugHTML {
    // MARK: Variables
    /// Raw HTML that's already been rendered.
    var rawHTML: String
    /// Create a new HTML debug instance.
    /// - Parameter content: Content to be rendered.
    public init<T: HTML>(content: () -> T) {
        self.rawHTML = content().renderFormatted()
    }
}

// MARK: Self: View
extension DebugHTML: View {
    // swiftlint:disable:next missing_docs
    public var body: some View {
        ScrollView([.horizontal, .vertical]) {
            Text(rawHTML)
        }
        .padding(.all)
        .frame(maxWidth: 400, maxHeight: 200)
    }
}

// MARK: Preview
#Preview {
    DebugHTML {
        h1 { "Hello, World!" }
    }
}
#endif
