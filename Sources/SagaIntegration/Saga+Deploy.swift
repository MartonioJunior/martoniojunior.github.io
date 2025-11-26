//
//  Saga+Deploy.swift
//  Website
//
//  Created by Martônio Júnior on 13/10/2025.
//

import CSS
import HTML
import HomeFeature
import Models
import PageFeature
import Saga
import SagaParsleyMarkdownReader
import Settings

public extension ArtsBlueprintsCodeWebsite {
    func deploy() async throws {
        let source = "ArtsBlueprintsCode"
        let destination = "Deploy"

        try await Saga(input: .init(source), output: .init(destination))
            .registerAreas(self)
            .registerPosts(self)
            .registerProjects(self)
            .blockPages(in: "about/templates/")
            .registerStandalone(self)
            .run()

        // writeIndex(to: destination, posts: [])

        try deployFolder("Sources/Assets/Resources", to: "Resources/EnergyTheme")
        try deployFolder(source+"/assets", to: "assets")
        try deployFolder("Sources/SagaIntegration/Resources", to: "")

        func deployFolder(_ path: String, to targetPath: String) throws {
            try copyFiles(
                from: .current.createSubfolderIfNeeded(at: path),
                into: .current.subfolder(at: destination).createSubfolderIfNeeded(at: targetPath)
            )
        }
    }
}
