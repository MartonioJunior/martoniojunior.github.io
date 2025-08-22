//
//  App.swift
//  Website
//
//  Created by Martônio Júnior on 02/06/2025.
//

import PublishIntegration
import Settings

@main
struct App {
    static func main() throws {
        try ArtsBlueprintsCodeWebsite().deploy()
    }
}
