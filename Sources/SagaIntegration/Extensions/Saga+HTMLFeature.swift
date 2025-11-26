//
//  Saga+HTMLFeature.swift
//  Website
//
//  Created by Martônio Júnior on 14/10/2025.
//

import HomeFeature
import HTML
import Models
import PageFeature
import Saga

// MARK: html
public func html<T>(
    _ metadata: T.Type = T.self,
    _ builder: @escaping (ItemRenderingContext<T>) throws -> some HTMLDoc
) -> (ItemRenderingContext<T>) throws -> String {
    { try String(builder($0), encoding: .utf8) }
}

public func html<T>(
    _ metadata: T.Type = T.self,
    _ website: ArtsBlueprintsCodeWebsite,
    _ builder: @escaping (ItemRenderingContext<T>) throws -> some HTMLComponent
) -> (ItemRenderingContext<T>) throws -> String {
    html { context in
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
    html(metadata, website) {
        HTMLRaw(try builder($0))
    }
}

// MARK: htmlMany
public func htmlMany<T>(
    _ metadata: T.Type = T.self,
    _ builder: @escaping (ItemsRenderingContext<T>) throws -> some HTMLDoc
) -> (ItemsRenderingContext<T>) throws -> String {
    { try String(builder($0), encoding: .utf8) }
}

public func htmlMany<T>(
    _ metadata: T.Type = T.self,
    _ website: ArtsBlueprintsCodeWebsite,
    selected: Models.Section? = nil,
    _ builder: @escaping (ItemsRenderingContext<T>) throws -> some HTMLComponent
) -> (ItemsRenderingContext<T>) throws -> String {
    htmlMany { context in
        let page = try builder(context)
        return website.bake(selected: selected) { page }
    }
}

// MARK: HTMLRaw (EX)
public extension HTMLRaw {
    static func itemWriter(_ context: ItemRenderingContext<EmptyMetadata>) throws -> String {
        try String(h1 { context.item.title }) +
        context.item.body
    }
}

// MARK: Saga (EX)
public extension Saga {
    func blockPages(in folderPath: String) throws -> Self {
        try register(
            folder: .init(folderPath),
            metadata: EmptyMetadata.self,
            readers: [.parsleyMarkdownReader],
            filter: { _ in false },
            writers: [.itemWriter(HTMLRaw.itemWriter)]
        )
    }

    func registerStandalone(_ website: ArtsBlueprintsCodeWebsite) throws -> Self {
        try register(
            metadata: EmptyMetadata.self,
            readers: [.parsleyMarkdownReader],
            writers: [.itemWriter(HTMLRaw.itemWriter)]
        )
    }
}
