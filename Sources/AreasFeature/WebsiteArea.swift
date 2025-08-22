//
//  WebsiteArea.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Foundation

public enum WebsiteArea: String {
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
extension WebsiteArea: CaseIterable {}

// MARK: Self: Codable
extension WebsiteArea: Codable {}

// MARK: Self: Hashable
extension WebsiteArea: Hashable {}

// MARK: Self: Identifiable
extension WebsiteArea: Identifiable {
    public var id: String { rawValue }
}
