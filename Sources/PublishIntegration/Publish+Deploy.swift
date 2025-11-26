//
//  Deploy.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import HighlightJSPublishPlugin
import Settings

public extension ArtsBlueprintsCodeWebsite {
    func deploy() throws {
        try publish(
            withTheme: .energy,
            rssFeedSections: .rssSections,
            deployedUsing: .gitHub("MartonioJunior/MartonioJunior.github.io", branch: "main", useSSH: false),
            additionalSteps: [
                .installPlugin(.highlightJS()),
                .processContent()
            ]
        )
    }
}
