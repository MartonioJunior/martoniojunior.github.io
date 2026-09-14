//
//  Saga+Deploy.swift
//  Website
//
//  Created by Martônio Júnior on 13/10/2025.
//

import FileClient
import Models
import Saga

public extension ArtsBlueprintsCodeWebsite {
    func deploy(_ source: String, to destination: String) async throws {
        try await Saga(input: .init(source), output: .init(destination))
            .registerAreas(self)
            .registerPosts(self)
            .registerProjects(self)
            .blockPages(in: "about/")
            .registerStandalone(self)
            .afterWrite { _ in
                try deployFolder("Sources/Assets/Resources", to: "Resources/EnergyTheme")
                try deployFolder(source + "/assets", to: "assets")
                try deployFolder("Sources/SagaIntegration/Resources", to: "")
            }
            .run()

        // writeIndex(to: destination, posts: [])
        @Sendable
        func deployFolder(_ path: String, to targetPath: String) throws {
            try Folder.current.createSubfolderIfNeeded(at: path).copyFiles(
                into: .current.subfolder(at: destination).createSubfolderIfNeeded(at: targetPath)
            )
        }
    }
}
