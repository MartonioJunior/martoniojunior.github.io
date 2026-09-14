//
//  Folder+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 15/10/2025.
//

public extension Folder {
    /// Copies files from this folder into another.
    /// - Parameter targetFolder: Folder that will receive all the files.
    /// - Throws: Error when file creation fails.
    func copyFiles(into targetFolder: Folder) throws {
        try files.recursive.forEach {
            let subfolder = $0.path(relativeTo: self)
            let deployedFile = try targetFolder.createFile(at: subfolder)
            try deployedFile.write($0.read())
        }
    }
}
