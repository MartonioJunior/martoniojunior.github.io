//
//  App.swift
//  Website
//
//  Created by Martônio Júnior on 02/06/2025.
//

import Models
import StaticSiteGenerator

/// App that builds the website.
@main
public enum App {
    /// Parses the content in the source folder and creates the website's contents into a destination folder.
    /// 
    /// This destination folder must be later on pushed in order to deploy the website online.
    static func main() async throws {
        try await ArtsBlueprintsCodeWebsite().deploy("ArtsBlueprintsCode")
    }
}
