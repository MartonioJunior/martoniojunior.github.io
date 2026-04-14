//
//  ArtsBlueprintsCodeWebsite+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 15/10/2025.
//

import Elementary
import FileClient
import Models
import PageFeature

public extension ArtsBlueprintsCodeWebsite {
    func bake(_ html: some HTML) -> some HTMLDocument {
        bake { html }
    }

    func bake<Content: HTML>(
        selected: Area? = nil,
        @HTMLBuilder _ content: @escaping () -> Content
    ) -> some HTMLDocument {
        PageDocument(
            name,
            description: description,
            navigation: .home.selecting(selected),
            content: content
        )
    }
}
