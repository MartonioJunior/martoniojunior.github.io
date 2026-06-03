//
//  Project.swift
//  Website
//
//  Created by Martônio Júnior on 23/10/2025.
//

/// Project that had it's development information published on the website.
public struct Project {}

// MARK: Self.Metadata
extension Project: ExpressibleByMarkdownPage {
    // swiftlint:disable:next missing_docs
    public struct Metadata {
        /// Checkbox used to validate publishing the page.
        public var published: Bool
        /// Name of the project.
        public var title: String
        /// Summary of what the project is about.
        public var description: String?
        /// Current status for the project.
        public var projectStatus: String?
        /// Relevant links for the project.
        public var links: String?
        /// Should this page be public on the website?
        public var isPublic: Bool { published }
    }
}

extension Project.Metadata: Codable {}
