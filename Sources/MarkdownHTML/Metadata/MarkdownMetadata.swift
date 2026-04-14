//
//  MarkdownMetadata.swift
//  Website
//
//  Created by Martônio Júnior on 16/01/2026.
//

import Markdown

public struct MarkdownMetadata {
    // MARK: Variables
    public var parameters: [String: String]
    
    // MARK: Initializers
    public init(parameters: [String : String]) {
        self.parameters = parameters
    }
}

// MARK: Document (EX)
public extension Document {
    var metadataDictionary: [String: String] {
        guard child(through: 0, as: ThematicBreak.self) != nil,
              let propertiesBlock = child(through: 1, as: Heading.self) else { return [:] }

        let textProperties = propertiesBlock.children.split {
            $0 is SoftBreak
        }.map {
            $0.reduce("") { $0 + $1.format() }
        }

        let result = textProperties.compactMap {
            let separators = $0.split(separator: ":", maxSplits: 1).map {
                $0.trimmingCharacters(in: .whitespaces)
            }

            return separators.count == 2 ? (separators[0].description, separators[1].description) : nil
        }

        return .init(uniqueKeysWithValues: result)
    }
}
