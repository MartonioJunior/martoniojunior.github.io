//
//  App.swift
//  Website
//
//  Created by Martônio Júnior on 02/06/2025.
//

import Models
import SagaIntegration

@main
struct App {
    static func main() async throws {
        try await ArtsBlueprintsCodeWebsite().deploy()
    }
}
