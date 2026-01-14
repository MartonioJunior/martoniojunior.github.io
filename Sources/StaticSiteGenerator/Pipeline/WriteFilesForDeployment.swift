//
//  WriteCSSToFiles.swift
//  Website
//
//  Created by Martônio Júnior on 16/10/2025.
//

import FileClient
import Models

public extension ArtsBlueprintsCodeWebsite {
    func copyFiles(from folder: Folder, into targetFolder: Folder) throws {
        try folder.files.recursive.forEach {
            let subfolder = $0.path(relativeTo: folder)
            let deployedFile = try targetFolder.createFile(at: subfolder)
            try deployedFile.write($0.read())
        }
    }
}
