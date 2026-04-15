//
//  FooterView.swift
//  Website
//
//  Created by Martônio Júnior on 24/06/25.
//

import Elementary

public struct FooterView {
    // MARK: Initializers
    public init() {}
}

// MARK: Self: HTML
extension FooterView: HTML {
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
import SwiftUI
import Styleguide

#Preview {
    DebugHTML {
        FooterView()
    }
}
#endif
