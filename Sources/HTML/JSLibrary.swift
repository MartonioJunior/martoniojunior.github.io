//
//  JSLibrary.swift
//  Website
//
//  Created by Martônio Júnior on 15/10/2025.
//


public protocol JSLibrary: HTMLComponent {}

// MARK: Default Implementation
public extension JSLibrary {}

// MARK: Encodable (EX)
import Foundation

public extension Encodable {
    func encodeToJS(_ encoder: JSONEncoder = .init()) throws -> String? {
        let data = try encoder.encode(self)
        return String(data: data, encoding: .utf8)
    }

}
