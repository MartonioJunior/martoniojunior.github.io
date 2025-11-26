//
//  PublishingStep+Content.swift
//  Website
//
//  Created by Martônio Júnior on 14/08/2025.
//

import Publish
import Settings

public extension PublishingStep where Site == ArtsBlueprintsCodeWebsite {
    static func processContent() -> Self {
        group([
            .addMarkdownFiles(at: "ArtsBlueprintsCode"),
            .removeDrafts(),
            .logPages()
        ])
    }

    static func removeDrafts() -> Self {
        group(Site.SectionID.allCases.map {
            .removeAllItems(in: $0, matching: .init {
                !$0.metadata.isPublic || $0.body.isEmpty
            })
        })
    }

    static func logPages() -> Self {
        .step(named: "Log of Website Pages") { context in
            context.pages.forEach { item in
                print("\(item.key): \(item.value)")
            }
        }
    }
}
