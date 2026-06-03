//
//  Summarizable.swift
//  Website
//
//  Created by Martônio Júnior on 03/06/2026.
//

/// Element that can summed up by a set of 2-3 sentences.
public protocol Summarizable {
    /// Synopsis of what the element is about.
    var summary: String { get }
}
