//
//  Taggable.swift
//  Website
//
//  Created by Martônio Júnior on 03/06/2026.
//

/// Element that can have tags attached to itself.
public protocol Taggable {
    /// Tags associated with this element.
    var tags: [Tag] { get }
}
