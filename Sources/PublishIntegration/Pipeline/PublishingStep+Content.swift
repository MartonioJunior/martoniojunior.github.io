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
            .removeDrafts()
        ])
    }

    static func removeDrafts() -> Self {
        group(Site.SectionID.allCases.map {
            .removeAllItems(in: $0, matching: .init {
                !$0.metadata.isPublic
            })
        })
    }
}
