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
    func deploy(_ source: String) async throws {
        try await deploy(source, to: deployPath())
    }

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
                try $0.deleteFolder(at: ".obsidian/")
                try $0.deleteFolder(at: "about/bases")
                try $0.deleteFolder(at: "about/templates")
                try $0.deleteFolder(at: "about/test")
            }
            .run()
    }

    func deployPath(devMode: Bool = Saga.isDev) -> String {
        devMode ? "Preview" : "Deploy"
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
    /// Deletes the contents of a folder.
    /// - Parameters:
    ///   - outputSubpath: Relative path of the folder that will be removed from build.
    ///   - root: Root used as the reference for the operation.
    ///   - dryRun: Should the folder be printed instead of deleted?
    /// - Throws: Error when any file operation fails.
    /// 
    /// Note: This method has a protection against accidental folder deletions during development.
    /// To avoid having a folder deleted, first test the method as-is:
    /// ```swift
    /// $0.deleteFolder(at: path)
    /// ````
    /// 
    /// This will output the folder that will be deleted. After checking everything is correct,
    /// test by temporarily setting `dryRun = false`
    ///  ```swift
    /// $0.deleteFolder(at: path, dryRun: false)
    /// ````
    /// 
    /// After confirming everything works as intended, remove the `dryRun` parameter.
    func deleteFolder(at outputSubpath: String, root: Folder = .current, dryRun: Bool = true) throws {
        guard let relativeOutputPath else { return }

        let targetFolder = try root.subfolder(at: relativeOutputPath).subfolder(at: outputSubpath)

        if dryRun, Self.isDev {
            print("Deleting folder on build: \(targetFolder.path)")
        } else {
            try targetFolder.delete()
            print("Deleted Output: \(targetFolder.path)")
        }
    }
}
