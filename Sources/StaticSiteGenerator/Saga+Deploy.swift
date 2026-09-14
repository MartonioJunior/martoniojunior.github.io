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
            .afterWrite {
                try $0.deployFolder("Sources/Assets/Resources", to: "Resources/EnergyTheme")
                try $0.deployFolder(source + "/assets", to: "assets")
                try $0.deployFolder("Sources/SagaIntegration/Resources", to: "")
            }
            .run()
    }
}

// MARK: Saga (EX)
public extension Saga {
    /// Copies the contents of a folder into the deployment folder
    /// - Parameters:
    ///   - path: Relative path of what folder will be copied.
    ///   - outputSubpath: Relative path of where the folder will be pasted.
    ///   - root: Root used as the reference for the copy-paste operation.
    ///
    /// - Throws: Error when any file operation fails
    func deployFolder(_ path: String, to outputSubpath: String, root: Folder = .current) throws {
        let relativeOutputPath = try outputPath.relativePath(from: rootPath)

        try root.createSubfolderIfNeeded(at: path).copyFiles(
            into: root.subfolder(at: relativeOutputPath.string).createSubfolderIfNeeded(at: outputSubpath)
        )
    }
}
