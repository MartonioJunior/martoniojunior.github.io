//
//  AnyHTML+Builder.swift
//  Website
//
//  Created by Martônio Júnior on 14/10/2025.
//

import HTML

public extension AnyHTML {
    init<T: HTML.View>(@HTML.Builder html: () -> T) {
        self.init(html())
    }
}
