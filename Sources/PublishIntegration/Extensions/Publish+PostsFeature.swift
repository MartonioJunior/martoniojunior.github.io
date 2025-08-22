//
//  ItemList.swift
//  Website
//
//  Created by Martônio Júnior on 24/06/25.
//

import Publish
import PostsFeature
import TagsFeature

// MARK: Post (EX)
public extension Post {
    init<Site: Website>(_ item: Item<Site>, site: Site) {
        self.init(
            title: item.title,
            summary: item.description,
            date: item.date,
            url: .init(string: item.path.absoluteString)!,
            tags: item.tags.remap(using: site),
            content: item.content.body
        )
    }
}

// MARK: Sequence (EX)
public extension Sequence {
    func remap<Site: Website>(using site: Site) -> [Post] where Element == Item<Site> {
        map { .init($0, site: site) }
    }
}
