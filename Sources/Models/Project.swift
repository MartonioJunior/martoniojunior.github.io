//
//  Project.swift
//  Website
//
//  Created by Martônio Júnior on 23/10/2025.
//

import HTML

public struct Project {}

// MARK: Self.Metadata
public typealias ProjectMetadata = Project.Metadata

extension Project: ExpressibleByMarkdownPage {
    public struct Metadata {
        public var published: Bool
        public var title: String
        public var description: String?

        public var isPublic: Bool { published }
    }
}

extension Project.Metadata: Decodable {}
