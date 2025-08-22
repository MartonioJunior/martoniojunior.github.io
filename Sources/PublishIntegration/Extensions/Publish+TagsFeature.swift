//
//  Energy+TagsFeature.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Foundation
import Publish
import TagsFeature

public extension TagsFeature.Tag {
    init(tag: Publish.Tag, path: Path) {
        self.init(
            tag.string,
            url: .init(string: path.absoluteString)!
        )
    }

    init<Site: Website>(tag: Publish.Tag, site: Site) {
        self.init(tag: tag, path: site.path(for: tag))
    }
}

// MARK: Sequence (EX)
public extension Sequence where Element == Publish.Tag {
    func remap<Site: Website>(using site: Site) -> [TagsFeature.Tag] {
        map { .init(tag: $0, site: site) }
    }
}
