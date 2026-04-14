//
//  MarkdownMetadataRemover.swift
//  Website
//
//  Created by Martônio Júnior on 16/01/2026.
//

import Markdown

public struct MarkdownMetadataRemover {
    var foundThematicBreak: Bool = false
}

// MARK: Self: MarkupWalker
extension MarkdownMetadataRemover: MarkupRewriter {
    public mutating func visitThematicBreak(_ thematicBreak: ThematicBreak) -> Optional<any Markup> {
        guard thematicBreak.parent is Document, thematicBreak.indexInParent == 0 else { return thematicBreak }

        foundThematicBreak = true
        return nil
    }

    public mutating func visitHeading(_ heading: Heading) -> Optional<any Markup> {
        guard heading.parent is Document, heading.indexInParent == 1, foundThematicBreak else { return heading }
        
        return nil
    }
}
