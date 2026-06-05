//
//  MarkdownMetadataRemover.swift
//  Website
//
//  Created by Martônio Júnior on 16/01/2026.
//

import Markdown

/// Markdown processor used to remove parts of the content.
public struct MarkdownMetadataRemover {
    /// Flag used to keep track of whether it has visited a thematic break.
    var foundThematicBreak: Bool = false
}

// MARK: Self: MarkupWalker
extension MarkdownMetadataRemover: MarkupRewriter {
    // swiftlint:disable:next missing_docs
    public mutating func visitThematicBreak(_ thematicBreak: ThematicBreak) -> (any Markup)? {
        guard thematicBreak.parent is Document, thematicBreak.indexInParent == 0 else { return thematicBreak }

        foundThematicBreak = true
        return nil
    }
    // swiftlint:disable:next missing_docs
    public mutating func visitHeading(_ heading: Heading) -> (any Markup)? {
        guard heading.parent is Document, heading.indexInParent == 1, foundThematicBreak else { return heading }

        return nil
    }
}
