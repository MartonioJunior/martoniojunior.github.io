//
//  DateView.swift
//  Website
//
//  Created by Martônio Júnior on 21/08/2025.
//

import CSS
import Foundation
import Plot

public struct DateView {
    // MARK: Variables
    var date: Date

    // MARK: Initializers
    public init(_ date: Date) {
        self.date = date
    }
}

// MARK: Self: Component
extension DateView: Component {
    public var body: Component {
        Paragraph(date.formatted(date: .abbreviated, time: .standard)).apply(.date)
    }
}

// MARK: CSSClasses (EX)
extension CSSClass {
    /// Represents a date in the content
    static var date: Self { "date" }
}
