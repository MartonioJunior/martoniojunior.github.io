//
//  MarkdownMetadata.swift
//  Website
//
//  Created by Martônio Júnior on 16/01/2026.
//

import Markdown

public struct MarkdownMetadata {
    // MARK: Variables
    var parameters: [String: String]
}

// MARK: Document (EX)
public extension Document {
    var metadata: MarkdownMetadata? {
        guard child(through: 0, as: ThematicBreak.self) != nil,
              let propertiesBlock = child(through: 1, as: Heading.self) else { return nil }
        
        let textProperties = propertiesBlock.children.compactMap { $0 as? Text }

        let result = textProperties.compactMap {
            let separators = $0.string.split(separator: ":", maxSplits: 1)
            
            return separators.count == 2 ? (separators[0].description, separators[1].description) : nil
        }

        return .init(parameters: .init(uniqueKeysWithValues: result))
    }
}
