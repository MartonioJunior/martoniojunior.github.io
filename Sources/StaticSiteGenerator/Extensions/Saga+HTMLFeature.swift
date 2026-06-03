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

// MARK: html
public func parseHTML<T>(
    _: T.Type = T.self,
    _ builder: @escaping (ItemRenderingContext<T>) throws -> some HTMLDocument
) -> (ItemRenderingContext<T>) throws -> String {
    { renderContext in
        try builder(renderContext).renderFormatted()
    }
}

public func parseHTML<T>(
    _: T.Type = T.self,
    _ website: ArtsBlueprintsCodeWebsite,
    _ builder: @escaping (ItemRenderingContext<T>) throws -> some HTML
) -> (ItemRenderingContext<T>) throws -> String {
    parseHTML { context in
        let page = try builder(context)
        return website.bake(page)
    }
}

// MARK: htmlRaw
public func htmlRaw<T>(
    _ metadata: T.Type = T.self,
    _ website: ArtsBlueprintsCodeWebsite,
    _ builder: @escaping (ItemRenderingContext<T>) throws -> String
) -> (ItemRenderingContext<T>) throws -> String {
    parseHTML(metadata, website) {
        HTMLRaw(try builder($0))
    }
}

// MARK: htmlMany
public func htmlMany<T>(
    _: T.Type = T.self,
    _ builder: @escaping (ItemsRenderingContext<T>) throws -> some HTMLDocument
) -> (ItemsRenderingContext<T>) throws -> String {
    { renderContext in
        try builder(renderContext).renderFormatted()
    }
}

public func htmlMany<T>(
    _: T.Type = T.self,
    _ website: ArtsBlueprintsCodeWebsite,
    selected: Models.Section? = nil,
    _ builder: @escaping (ItemsRenderingContext<T>) throws -> some HTML
) -> (ItemsRenderingContext<T>) throws -> String {
    htmlMany { context in
        let page = try builder(context)
        return website.bake(selected: selected) { page }
    }
}

// MARK: HTMLRaw (EX)
public extension HTMLRaw {
    static func itemWriter(_ context: ItemRenderingContext<EmptyMetadata>) throws -> String {
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
            readers: [.customMarkdownRenderer()],
            filter: { _ in false },
            writers: [.itemWriter(HTMLRaw.itemWriter)]
        )
    }

    func registerStandalone(_ website: ArtsBlueprintsCodeWebsite) -> Self {
        register(
            metadata: EmptyMetadata.self,
            readers: [.customMarkdownRenderer()],
            writers: [.itemWriter(HTMLRaw.itemWriter)]
        )
    }
}
