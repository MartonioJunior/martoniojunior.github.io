//
//  WriteHTMLToFile.swift
//  Website
//
//  Created by Martônio Júnior on 14/10/2025.
//

import FileClient
import Foundation
import HomeFeature
import HTML
import Models

public extension ArtsBlueprintsCodeWebsite {
    func write(_ htmlMap: [String: any HTMLDoc], to outputFolder: Folder) throws {
        for (relativePath, html) in htmlMap {
            let file = try outputFolder.createFileIfNeeded(at: relativePath)
            try file.write(String(html))
            print("Generated HTML at \(file)")
        }
    }

    func writeIndex(to destination: String, posts: [Post]) throws {
        try write([
            "index.html": bake(HomePageScreen(posts: posts))
        ], to: .current.createSubfolderIfNeeded(withName: destination))
    }
}
