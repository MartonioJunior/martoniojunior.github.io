//
//  ItemList.swift
//  Website
//
//  Created by Martônio Júnior on 24/06/25.
//

import HTML
import Publish
import PostsFeature
import TagViewerFeature

// MARK: Post (EX)
public extension Post {
    init<Site: Website>(_ item: Item<Site>, site: Site) {
        self.init(
            title: item.title,
            summary: item.description,
            created: item.date,
            modified: item.lastModified,
            tags: item.tags.remap(using: site),
            url: .init(string: item.path.absoluteString)!
        ) {
            AnyHTML { item.content.body.html }
        }
    }
}

// MARK: Sequence (EX)
public extension Sequence {
    func remap<Site: Website>(using site: Site) -> [Post] where Element == Item<Site> {
        map { .init($0, site: site) }
    }
}
