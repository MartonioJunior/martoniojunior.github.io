//
//  PathKit+FileClient.swift
//  Website
//
//  Created by Martônio Júnior on 15/10/2025.
//

import FileClient
import PathKit

// MARK: File (EX)
public extension File {
    static func path(_ path: Path) throws -> Self {
        try .init(path: path.string)
    }
}

// MARK: Folder (EX)
public extension Folder {
    static func path(_ path: Path) throws -> Self {
        try .init(path: path.string)
    }
}
