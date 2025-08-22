//
//  FooterView.swift
//  Website
//
//  Created by Martônio Júnior on 24/06/25.
//

import Plot

public struct FooterView {
    // MARK: Initializers
    public init() {}
}

// MARK: Self: Component
extension FooterView: Component {
    public var body: Component {
        Footer {
            Paragraph("Created by Martônio Jr.")
            Paragraph {
                Text("Built in Swift using ")
                Link("Publish", url: "https://github.com/johnsundell/publish")
            }
            Paragraph {
                Link("RSS", url: "/feed.rss")
                Text(" | ")
                Link("Github", url: "https://github.com/martoniojunior")
            }
        }
    }
}
