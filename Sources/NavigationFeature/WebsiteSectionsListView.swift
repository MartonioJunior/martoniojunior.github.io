//
//  WebsiteSectionsListView.swift
//  Website
//
//  Created by Martônio Júnior on 20/08/2025.
//

import Elementary
import Models
import Styleguide

/// Component that lets you create a display for the website's sections.
public struct WebsiteSectionsListView<Content: HTML> {
    // MARK: Variables
    /// Current state of the component.
    var model: Model
    /// HTML wrapper for a website section.
    /// 
    /// Changes based on the currently selected section.
    var content: (WebsiteSection) -> Content
    // MARK: Initializers
    /// Creates a new list view using the model.
    /// - Parameters:
    ///   - model: State for the component.
    ///   - content: HTML wrapper for a website section.
    ///
    public init(
        _ model: Model,
        @HTMLBuilder content: @escaping (WebsiteSection) -> Content = WebsiteSectionBadge.init
    ) {
        self.model = model
        self.content = content
    }
    /// Creates a new list view using a list of sections.
    /// - Parameters:
    ///   - sections: Sections to be displayed.
    ///   - selected: Is any section currently selected or active?
    ///   - content: HTML wrapper for a website section.
    ///
    public init(
        _ sections: [WebsiteSection],
        selected: WebsiteSection? = nil,
        @HTMLBuilder content: @escaping (WebsiteSection) -> Content = WebsiteSectionBadge.init
    ) {
        self.init(.init(sections, selected: selected), content: content)
    }
}

// MARK: Self.Model
public extension WebsiteSectionsListView {
    typealias Model = WebsiteSectionsListViewModel
}

/// Model for `WebsiteSectionsListView`.
/// 
/// This is not a subtype as it's static in relation to the main type's Generics.
public struct WebsiteSectionsListViewModel {
    // MARK: Variables
    /// Sections defined for this view.
    var sections: [WebsiteSection]
    /// Currently selected view.
    var selected: WebsiteSection?
    /// How many sections does this view have?
    public var numberOfSections: Int { sections.count }
    // MARK: Initializers
    /// Creates a new model.
    /// - Parameters:
    ///   - sections: Sections defined for this view.
    ///   - selected: Currently selected view.
    ///
    public init(
        _ sections: [WebsiteSection],
        selected: WebsiteSection? = nil
    ) {
        self.sections = sections
        self.selected = selected
    }
    // MARK: Methods
    /// Selects a website section.
    /// - Parameter section: Section to be selected.
    /// - Returns: New model with the transformed selection.
    public func selecting(_ section: WebsiteSection? = nil) -> Self {
        .init(sections, selected: section)
    }
}

public extension WebsiteSectionsListViewModel {
    /// Navigation bar used in the Home page.
    static var home: Self {
        .init(WebsiteSection.allCases, selected: nil)
    }
}

// MARK: Self: HTML
extension WebsiteSectionsListView: HTML {
    // swiftlint:disable:next missing_docs
    public var body: some HTML {
        ul {
            for section in model.sections {
                li {
                    content(section)
                }
                .attributes(.class(.selected), when: section == model.selected)
            }
        }
    }
}

// MARK: Previews
#if DEBUG && canImport(SwiftUI)
import SwiftUI

#Preview {
    DebugHTML {
        WebsiteSectionsListView(.home) {
            "Hello, \($0.title)!"
        }
    }
}
#endif
