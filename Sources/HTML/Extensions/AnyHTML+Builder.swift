//
//  AnyHTML+Builder.swift
//  Website
//
//  Created by Martônio Júnior on 14/10/2025.
//

import SwiftHTML

public extension AnyHTML {
    init<T: HTML>(@HTMLBuilder html: () -> T) {
        self.init(html())
    }
}
