//
//  Project.swift
//  Website
//
//  Created by Martônio Júnior on 23/10/2025.
//

import Elementary
import Foundation

// TODO: Project Status

/// Project that had it's development information published on the website.
public struct Project {
    /// Type that describes content authored for a project page.
    public typealias Content = any HTML
    // MARK: Variables
    /// Content associated with this project page.
    public var content: Content
    /// When was this project page created?
    public var creationDate: Date
    /// When was this project page last modified?
    public var lastModified: Date?
    /// Relevant links associated with the project.
    public var links: [URL]
    /// Synopsis of what the project is about.
    public var summary: String
    /// Tags associated with this project.
    public var tags: [Tag]
    /// Display title for the project.
    public var title: String
    /// Link to access this project page.
    public var url: URL
}

// MARK: Self.Metadata
extension Project: ExpressibleByMarkdownPage {
    // swiftlint:disable:next missing_docs
    public struct Metadata {
        /// Flag used to indicate publishing the page.
        public var published: Bool
        /// Name of the project.
        public var title: String
        /// Summary of what the project is about.
        public var description: String?
        /// Frozen date of creation for the project.
        /// 
        /// When `nil`, uses the metadata of the file itself.
        public var created: String?
        /// Frozen date of last update for the project.
        /// 
        /// When `nil`, uses the metadata of the file itself.
        public var modified: String?
        /// Current status for the project.
        public var projectStatus: String?
        /// Relevant links for the project.
        public var links: String?
    }
}

extension Project.Metadata: Codable {}

// MARK: Self: Publishable
extension Project: Publishable {
    // swiftlint:disable:next missing_docs
    public var isPublic: Bool { true }
}

// MARK: Self: Taggable
extension Project: Taggable {}
