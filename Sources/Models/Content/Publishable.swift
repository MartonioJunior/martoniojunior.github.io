//
//  Publishable.swift
//  Website
//
//  Created by Martônio Júnior on 03/06/2026.
//

import Foundation

/// Element that can be published on the website.
public protocol Publishable {
    /// Flag used to indicate whether a page should be public on the website.
    var isPublic: Bool { get }
    /// When was this element first created?
    var creationDate: Date { get }
    /// When was this element last modified?
    var lastModified: Date? { get }
    /// Display title for the element.
    var title: String { get }
    /// Link to access this page on the website.
    var url: URL { get }
}

// MARK: Default Implementation
public extension Publishable {
    /// Date representing the most recent update made for this element.
    var lastUpdate: Date { lastModified ?? creationDate }
}
