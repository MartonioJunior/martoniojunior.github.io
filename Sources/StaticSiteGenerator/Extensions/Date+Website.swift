//
//  Date+Website.swift
//  Website
//
//  Created by Martônio Júnior on 20/01/2026.
//

import Foundation

// MARK: Date (EX)
public extension Date {
    /// Creates a date from a string using the formatter passed in.
    /// - Parameters:
    ///   - text: String containing the date.
    ///   - formatter: Formatter used to obtain a date. If no value is passed, uses the default for the website.
    /// - Returns: Formatted date, `nil` when parsing fails.
    static func fromString(_ text: String, formatter: DateFormatter = .websiteDefault) -> Date? {
        formatter.date(from: text)
    }
}

// MARK: DateFormatter (EX)
public extension DateFormatter {
    /// Default Date Formatter for the website.
    static var websiteDefault: Self {
        let formatter = Self()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }
}
