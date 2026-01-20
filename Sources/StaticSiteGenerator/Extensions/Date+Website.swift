//
//  Date+Website.swift
//  Website
//
//  Created by Martônio Júnior on 20/01/2026.
//

import Foundation

// MARK: Date (EX)
public extension Date {
    static func websiteParse(_ text: String) -> Date? {
        DateFormatter.websiteDateTime.date(from: text)
    }
}

// MARK: DateFormatter (EX)
public extension DateFormatter {
    static var websiteDateTime: Self {
        let formatter = Self()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }
}
