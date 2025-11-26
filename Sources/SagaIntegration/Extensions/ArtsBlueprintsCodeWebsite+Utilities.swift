//
//  ArtsBlueprintsCodeWebsite+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 15/10/2025.
//

import FileClient
import HTML
import Models
import PageFeature

public extension ArtsBlueprintsCodeWebsite {
    func bake(_ html: some HTMLComponent) -> some HTMLDoc {
        bake { html }
    }

    func bake<Content: HTMLComponent>(
        selected: Area? = nil,
        @HTMLBuilder _ content: @escaping () -> Content
    ) -> some HTMLDoc {
        PageDocument(
            name,
            description: description,
            navigation: .home.selecting(selected),
            content: content
        )
    }
}
