//
//  WebsiteSectionBadge.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Elementary
import Models
import Styleguide

public struct WebsiteSectionBadge {
    // MARK: Variables
    var area: WebsiteSection

    // MARK: Initializers
    public init(_ area: WebsiteSection) {
        self.area = area
    }
}

// MARK: Self: HTML
extension WebsiteSectionBadge: HTML {
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
