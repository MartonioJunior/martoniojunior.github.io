//
//  Saga+ProjectsFeature.swift
//  Website
//
//  Created by Martônio Júnior on 03/11/2025.
//

import Elementary
import Models
import Saga
import Styleguide

public extension Project {
    static func writer(_: ItemRenderingContext<Metadata>) -> some HTML {
        HTMLRaw("Writer was not yet implemented!")
    }

    @HTMLBuilder
    static func listWriter(_: ItemsRenderingContext<Metadata>) -> some HTML {
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
        register(
            folder: "projects",
            metadata: Project.Metadata.self,
            readers: [.customMarkdownRenderer()],
            // itemProcessor: Project.preprocessor,
            filter: \.metadata.isPublic,
            writers: [
                .itemWriter(parseHTML(Project.Metadata.self, website, Project.writer)),
                .listWriter(htmlMany(Project.Metadata.self, website, selected: .projects, Project.listWriter))
            ]
        )
    }
}
