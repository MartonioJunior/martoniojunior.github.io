//
//  WebsiteSectionScreen.swift
//  Website
//
//  Created by Martônio Júnior on 14/10/2025.
//

import Elementary
import Models

/// Typealias for a section in the website.
/// 
/// Used as a disambiguator from the <section> HTML component.
public typealias WebsiteSection = Models.Section

/// Landing page for a section of the website.
public struct WebsiteSectionScreen<Content: HTML> {
    // MARK: Variables
    /// Section of the website.
    /// 
    /// When `nil`, assumes the behaviour of the home page.
    var area: WebsiteSection?
    /// HTML content of this page.
    var content: () -> Content
    // MARK: Initializers
    /// Creates the page for a section of the website.
    /// - Parameters:
    ///   - area: Section of the website.
    ///   - content: HTML content of this page.
    ///
    public init(
        _ area: WebsiteSection? = nil,
        @HTMLBuilder content: @escaping () -> Content
    ) {
        self.area = area
        self.content = content
    }
}

// MARK: Self: HTML
extension WebsiteSectionScreen: HTML {
    // swiftlint:disable:next missing_docs
    public var body: some HTML {
        div {
            h1 { area?.title ?? "What's new?" }
            content()
        }
    }
}

// MARK: Previews
#if DEBUG && canImport(SwiftUI)
import Styleguide
import SwiftUI

#Preview {
    DebugHTML {
        WebsiteSectionScreen {
            "Hello, World!"
        }
    }
}
#endif
