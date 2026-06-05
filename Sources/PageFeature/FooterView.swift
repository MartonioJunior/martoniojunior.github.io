//
//  FooterView.swift
//  Website
//
//  Created by Martônio Júnior on 24/06/25.
//

import Elementary

/// Component that describes a common footer for the Website.
public struct FooterView {
    // MARK: Initializers
    /// Creates a new footer instance.
    public init() {}
}

// MARK: Self: HTML
extension FooterView: HTML {
    // swiftlint:disable:next missing_docs
    public var body: some HTML {
        footer {
            p { "© 2025 Martônio Júnior" }
            p {
                "Website built in Swift using "
                a(.href("https://github.com/loopwerk/Saga")) { "Saga" }
            }
            p {
                a(.href("/feed.rss")) { "RSS" }
                " | "
                a(.href("https://github.com/martoniojunior")) { "Github" }
            }
        }
    }
}

// MARK: Previews
#if DEBUG && canImport(SwiftUI)
import Styleguide
import SwiftUI

#Preview {
    DebugHTML {
        FooterView()
    }
}
#endif
