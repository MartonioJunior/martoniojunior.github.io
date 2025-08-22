//
//  Website.swift
//  Website
//
//  Created by Martônio Júnior on 02/06/2025.
//

import AreasFeature
import Foundation
import Publish
import Plot
import Settings

// MARK: ArtsBlueprintsCodeWebsite (EX)
extension ArtsBlueprintsCodeWebsite: Website {
    public var language: Language { .english }
    public var imagePath: Path? { nil }

    public typealias SectionID = WebsiteArea
    public typealias ItemMetadata = Metadata
}

// MARK: WebsiteArea (EX)
extension WebsiteArea: WebsiteSectionID {}
