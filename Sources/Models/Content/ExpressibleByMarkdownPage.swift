//
//  ExpressibleByMarkdownPage.swift
//  Website
//
//  Created by Martônio Júnior on 15/10/2025.
//

/// Defines a type that can be constructed from a markdown page.
public protocol ExpressibleByMarkdownPage {
    /// Metadata associated with a markdown page, containing information that was processed 
    /// from the Markdown representation.
    associatedtype Metadata: Codable
}
