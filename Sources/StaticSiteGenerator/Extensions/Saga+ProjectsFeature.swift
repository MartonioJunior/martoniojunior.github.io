//
//  Saga+ProjectsFeature.swift
//  Website
//
//  Created by Martônio Júnior on 03/11/2025.
//

import Elementary
import Models
import Saga
import SagaParsleyMarkdownReader
import Styleguide

public extension Project {
    static func writer(_: ItemRenderingContext<Metadata>) -> some HTML {
        HTMLRaw("Writer was not yet implemented!")
    }

    @HTMLBuilder
    static func listWriter(_: ItemsRenderingContext<Metadata>) -> some HTML {
        h1 { "Projects " }
        EmptyView()
    }
}

extension Project.Metadata: Metadata {}

// MARK: Saga (EX)
public extension Saga {
    func registerProjects(
        _ website: ArtsBlueprintsCodeWebsite
    ) throws -> Self {
        register(
            folder: "projects",
            metadata: Project.Metadata.self,
            readers: [.parsleyMarkdownReader],
            // itemProcessor: Project.preprocessor,
            filter: \.metadata.published,
            writers: [
                .itemHTML { context in
                    website.createPage {
                        Project.writer(context)
                    }
                },
                .listHTML { context in
                    website.createPage(section: .projects) {
                        Project.listWriter(context)
                    }
                }
            ]
        )
    }
}
