//
//  MarkdownMetadata.swift
//  Website
//
//  Created by Martônio Júnior on 16/01/2026.
//

import Markdown

/// Collection of metadata information defined in a Markdown header.
/// 
/// This metadata can be associated to a document's header or to a specific block.
public struct MarkdownMetadata {
    // MARK: Variables
    /// Set of properties in a Markdown header.
    public var parameters: [String: String]
    // MARK: Initializers
    /// Defines a new container of markdown metadata.
    /// - Parameter parameters: Set of properties in a Markdown header.
    public init(_ parameters: [String: String]) {
        self.parameters = parameters
    }
}

// MARK: DotSyntax
public extension MarkdownMetadata {
    static func fromLines(_ lines: [String]) -> Self {
        let result = lines.compactMap {
            let separators = $0.split(separator: ":", maxSplits: 1).map {
                $0.trimmingCharacters(in: .whitespaces)
            }

            let numberOfRequiredSeparators = 2
            return if separators.count == numberOfRequiredSeparators {
                (separators[0].description, separators[1].description)
            } else { nil }
        }

        return .init(.init(result, uniquingKeysWith: { a, _ in a }))
    }
}

// MARK: Self: Equatable
extension MarkdownMetadata: Equatable {}

// MARK: Self: ExpressibleByDictionaryLiteral
extension MarkdownMetadata: ExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (String, String)...) {
        self.init(.init(uniqueKeysWithValues: elements))
    }
}

// MARK: Self: Sendable
extension MarkdownMetadata: Sendable {}

// MARK: Document (EX)
public extension Document {
    /// Dictionary metadata from a Markdown document's header.
    var metadata: MarkdownMetadata {
        guard child(through: 0, as: ThematicBreak.self) != nil,
            let propertiesBlock = child(through: 1, as: Heading.self) else { return [:] }

        let textProperties = propertiesBlock.children.split {
            $0 is SoftBreak
        }.map {
            $0.reduce(into: "") { $0 += $1.format() }
        }

        return .fromLines(textProperties)
    }
}
