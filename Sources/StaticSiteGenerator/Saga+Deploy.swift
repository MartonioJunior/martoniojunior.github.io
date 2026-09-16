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
            .registerStandalone(self)
            .afterWrite {
                try $0.deployFolder("Sources/Assets/Resources", to: "Resources/EnergyTheme")
                try $0.deployFolder(source + "/assets", to: "assets")
                try $0.deployFolder("Sources/SagaIntegration/Resources", to: "")
                try $0.deleteFolder(at: ".obsidian/", destructive: true)
                try $0.deleteFolder(at: "about/bases", destructive: true)
                try $0.deleteFolder(at: "about/templates", destructive: true)
                try $0.deleteFolder(at: "about/test", destructive: true)
            }
            .run()
    }
}

// MARK: Saga (EX)
public extension Saga {
    var relativeOutputPath: String? {
        try? outputPath.relativePath(from: rootPath).string
    }
    /// Copies the contents of a folder into the deployment folder
    /// - Parameters:
    ///   - path: Relative path of what folder will be copied.
    ///   - outputSubpath: Relative path of where the folder will be pasted.
    ///   - root: Root used as the reference for the copy-paste operation.
    ///
    /// - Throws: Error when any file operation fails
    func deployFolder(_ path: String, to outputSubpath: String, root: Folder = .current) throws {
        guard let relativeOutputPath else { return }

        try root.createSubfolderIfNeeded(at: path).copyFiles(
            into: root.subfolder(at: relativeOutputPath).createSubfolderIfNeeded(at: outputSubpath)
        )
    }

    func deleteFolder(at outputSubpath: String, root: Folder = .current, destructive: Bool = false) throws {
        guard let relativeOutputPath else { return }

        let targetFolder = try root.subfolder(at: relativeOutputPath).subfolder(at: outputSubpath)

        if destructive {
            try targetFolder.delete()
        } else {
            print("Dry run of deletion: \(targetFolder)")
        }
    }
}
