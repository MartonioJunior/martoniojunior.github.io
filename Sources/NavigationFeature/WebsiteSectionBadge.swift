//
//  WebsiteSectionBadge.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Elementary
import Models
import Styleguide

/// Badge component representing a section of the Website.
public struct WebsiteSectionBadge {
    // MARK: Variables
    /// Section of the website.
    var area: WebsiteSection
    // MARK: Initializers
    /// Creates a new badge for a section of the website.
    /// - Parameter area: Section of the website.
    public init(_ area: WebsiteSection) {
        self.area = area
    }
}

// MARK: Self: HTML
extension WebsiteSectionBadge: HTML {
    // swiftlint:disable:next missing_docs
    public var body: some HTML {
        a(.href(area.url.relativePath)) {
            area.title
        }
    }
}

// MARK: Previews
#if DEBUG && canImport(SwiftUI)
import SwiftUI

#Preview {
    DebugHTML {
        WebsiteSectionBadge(.about)
    }
}
#endif
