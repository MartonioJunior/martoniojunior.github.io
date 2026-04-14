//
//  AnyHTML+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 14/10/2025.
//

import Elementary

public extension HTML {
    func eraseToRawHTML() -> HTMLRaw {
        HTMLRaw(render())
    }
}
