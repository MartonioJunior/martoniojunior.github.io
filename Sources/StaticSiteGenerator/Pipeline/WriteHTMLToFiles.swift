//
//  WriteHTMLToFile.swift
//  Website
//
//  Created by Martônio Júnior on 14/10/2025.
//

import Elementary
import FileClient
import Foundation
import HomeFeature
import Models

public extension ArtsBlueprintsCodeWebsite {
    func write(_ htmlMap: [String: any HTMLDocument], to outputFolder: Folder) throws {
        for (relativePath, html) in htmlMap {
            let file = try outputFolder.createFileIfNeeded(at: relativePath)
            try file.write(html.renderFormatted())
            print("Generated HTML at \(file)")
        }
    }

    func writeIndex(to destination: String, posts: [Post]) throws {
        try write([
            "index.html": createPage { HomePageScreen(posts: posts) }
        ], to: .current.createSubfolderIfNeeded(withName: destination))
    }
}
