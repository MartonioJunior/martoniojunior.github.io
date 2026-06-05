//
//  JSLibrary.swift
//  Website
//
//  Created by Martônio Júnior on 15/10/2025.
//

import Elementary

/// Defines a JavaScript library that can be added to an HTML page.
public protocol JSLibrary: HTML {}

// MARK: Default Implementation
public extension JSLibrary {}

// MARK: Encodable (EX)
import Foundation

public extension Encodable {
    /// Encodes the module to a JSON representation.
    /// - Parameter encoder: Encoder used in the representation
    /// - Throws: Encoding error when the encode fails.
    /// - Returns: The instance encoded as a JSON representation.
    func encodeToJson(_ encoder: JSONEncoder = .init()) throws -> String? {
        let data = try encoder.encode(self)
        return String(data: data, encoding: .utf8)
    }
}
