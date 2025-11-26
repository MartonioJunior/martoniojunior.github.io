//
//  Section.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Foundation
import HTML

public enum Section: String {
    // MARK: Cases
    case posts
    case projects
    case artsCrafts
    case web
    case about
    case contact

    // MARK: Variables
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

    public var url: URL { .init(string: "/\(id)")! }
}

// MARK: Self: CaseIterable
extension Section: CaseIterable {}

// MARK: Self: Codable
extension Section: Codable {}

// MARK: Self: Equatable
extension Section: Equatable {}

// MARK: Self.ExpressibleByMarkdownPage
public typealias WebsiteAreaMetadata = Section.Metadata

extension Section: ExpressibleByMarkdownPage {
    public struct Metadata {
        public var section: Section
    }
}

extension WebsiteAreaMetadata: Decodable {}

// MARK: Self: Hashable
extension Section: Hashable {}

// MARK: Self: Identifiable
extension Section: Identifiable {
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
