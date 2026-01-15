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
    func bake(_ html: some HTML.View) -> some HTML.DocumentProtocol {
        bake { html }
    }

    func bake<Content: HTML.View>(
        selected: Area? = nil,
        @HTML.Builder _ content: @escaping () -> Content
    ) -> some HTML.DocumentProtocol {
        PageDocument(
            name,
            description: description,
            navigation: .home.selecting(selected),
            content: content
        )
    }
}
