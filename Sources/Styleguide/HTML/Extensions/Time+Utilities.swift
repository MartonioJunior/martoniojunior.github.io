//
//  Time+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 29/08/2025.
//

import Elementary
import Foundation

public extension HTMLElement where Tag == HTMLTag.time {
    /// Creates a <time> from a `Date`.
    /// - Parameters:
    ///   - date: Date used as the base.
    ///   - dateFormat: Date format.
    ///   - timeFormat: Time format.
    ///
    /// - Returns: A new <time> element with the formatted `date`.
    static func date(
        _ date: Date,
        dateFormat: Date.FormatStyle.DateStyle = .abbreviated,
        timeFormat: Date.FormatStyle.TimeStyle = .shortened
    ) -> Self where Content == HTMLText {
        .init(attributes: [.dateTime(date)]) {
            HTMLText(date.formatted(date: dateFormat, time: timeFormat))
        }
    }
}
