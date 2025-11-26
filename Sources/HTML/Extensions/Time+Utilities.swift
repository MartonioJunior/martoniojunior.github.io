//
//  Time+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 29/08/2025.
//

import Foundation

public extension HTMLElementTypes.Time {
    static func date(
        _ date: Date,
        dateFormat: Date.FormatStyle.DateStyle = .abbreviated,
        timeFormat: Date.FormatStyle.TimeStyle = .shortened
    ) -> some HTMLComponent {
        Self(datetime: .init(stringLiteral: date.formatted())) {
            date.formatted(date: dateFormat, time: timeFormat)
        }
    }
}
