//
//  FooterView.swift
//  Website
//
//  Created by Martônio Júnior on 24/06/25.
//

import HTML

public struct FooterView {
    // MARK: Initializers
    public init() {}
}

// MARK: Self: HTMLComponent
extension FooterView: HTMLComponent {
    public var body: some HTMLComponent {
        footer {
            p { "© 2025 Martônio Júnior" }
            p {
                "Website built in Swift using "
                a(href: "https://github.com/coenttb/swift-html") { "swift-html" }
                " and "
                a(href: "https://github.com/loopwerk/Saga") { "Saga" }
            }
            p {
                a(href: "/feed.rss") { "RSS" }
                " | "
                a(href: "https://github.com/martoniojunior") { "Github" }
            }
        }
    }
}
