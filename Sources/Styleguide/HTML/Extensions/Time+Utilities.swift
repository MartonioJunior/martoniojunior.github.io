//
//  Time+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 29/08/2025.
//

import Elementary
import Foundation

public extension HTMLElement where Tag == HTMLTag.time {
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
