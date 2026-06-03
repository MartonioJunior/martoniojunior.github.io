//
//  Section.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Foundation

/// Section in the website.
/// 
/// Each section has it's own structure and format for what it makes available
public enum Section: String {
    // MARK: Cases
    /// Section about the website.
    case about = "about"
    /// Section containing arts and crafts works.
    case artsCrafts = "artsCrafts"
    /// Contact information.
    case contact = "contacts"
    /// Posts and Articles of the website.
    case posts = "posts"
    /// Projects and digital software works.
    case projects = "projects"
    /// Recommendation links from around the Web.
    case web = "web"
    // MARK: Variables
    /// Display name of this section.
    public var title: String {
        switch self {
            case .posts: "Posts"
            case .projects: "Projects"
            case .artsCrafts: "Arts and Crafts"
            case .web: "Surfing the Web"
            case .about: "About"
            case .contact: "Contact"
        }
    }
    /// Page to access this section on the website.
    public var url: URL { .init(string: "/\(id)")! }
}

// MARK: Self: CaseIterable
extension Section: CaseIterable {
    /// A collection of all values of this type.
    /// 
    /// Not synthetized so it provides a navigation order for the sections.
    public static var allCases: [Section] {
        [.posts, .projects, .artsCrafts, .web, .about, .contact]
    }
}

// MARK: Self: Codable
extension Section: Codable {}

// MARK: Self: Equatable
extension Section: Equatable {}

// MARK: Self.ExpressibleByMarkdownPage
public typealias WebsiteAreaMetadata = Section.Metadata

extension Section: ExpressibleByMarkdownPage {
    /// Metadata information about the index page of a section in the website.
    public struct Metadata {
        /// Section that this markdown page represents.
        public var section: Section
    }
}

extension Section.Metadata: Codable {}

// MARK: Self: Hashable
extension Section: Hashable {}

// MARK: Self: Identifiable
extension Section: Identifiable {
    // swiftlint:disable:next missing_docs
    public var id: String {
        switch self {
            case .posts: "posts"
            case .projects: "projects"
            case .artsCrafts: "artsCrafts"
            case .web: "web"
            case .about: "about"
            case .contact: "contact"
        }
    }
}

// MARK: Self: Sendable
extension Section: Sendable {}
