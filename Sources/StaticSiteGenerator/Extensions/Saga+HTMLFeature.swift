//
//  Saga+HTMLFeature.swift
//  Website
//
//  Created by Martônio Júnior on 14/10/2025.
//

import Elementary
import HomeFeature
import Models
import PageFeature
import Saga
import SagaParsleyMarkdownReader

public extension Writer {
    static func itemHTML<Output: HTML & SendableMetatype>(
        _ builder: @escaping @Sendable (ItemRenderingContext<M>) throws -> Output
    ) -> Self {
        .itemWriter { try builder($0).renderFormatted() }
    }

    static func listHTML<Output: HTML & SendableMetatype>(
        _ builder: @escaping @Sendable (ItemsRenderingContext<M>) throws -> Output
    ) -> Self {
        .listWriter { try builder($0).renderFormatted() }
    }
}

// MARK: HTMLRaw (EX)
public extension HTMLRaw {
    static func itemWriter(_ context: ItemRenderingContext<EmptyMetadata>) -> String {
        h1 { context.item.title }.render() +
        context.item.body
    }
}

// MARK: Saga (EX)
public extension Saga {
    func blockPages(in folderPath: String) -> Self {
        register(
            folder: .init(folderPath),
            metadata: EmptyMetadata.self,
            readers: [.parsleyMarkdownReader],
            filter: { _ in false },
            writers: [.itemWriter(HTMLRaw.itemWriter)]
        )
    }

    func registerStandalone(_ website: ArtsBlueprintsCodeWebsite) -> Self {
        register(
            metadata: EmptyMetadata.self,
            readers: [.parsleyMarkdownReader],
            writers: [.itemWriter(HTMLRaw.itemWriter)]
        )
    }
}
