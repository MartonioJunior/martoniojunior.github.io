//
//  Saga+ProjectsFeature.swift
//  Website
//
//  Created by Martônio Júnior on 03/11/2025.
//

import HTML
import Models
import Saga

public extension Project {
    static func writer(_: ItemRenderingContext<Metadata>) -> some HTML.View {
        HTMLRaw("Writer was not yet implemented!")
    }

    @HTMLBuilder
    static func listWriter(_: ItemsRenderingContext<Metadata>) -> some HTML.View {
        h1 { "Projects "}
        EmptyView()
    }
}

extension ProjectMetadata: Metadata {}

// MARK: Saga (EX)
public extension Saga {
    func registerProjects(
        _ website: ArtsBlueprintsCodeWebsite
    ) throws -> Self {
        try register(
            folder: "projects",
            metadata: Project.Metadata.self,
            readers: [.parsleyMarkdownReader],
            // itemProcessor: Project.preprocessor,
            filter: \.metadata.isPublic,
            writers: [
                .itemWriter(html(Project.Metadata.self, website, Project.writer)),
                .listWriter(htmlMany(Project.Metadata.self, website, selected: .projects, Project.listWriter))
            ]
        )
    }
}
