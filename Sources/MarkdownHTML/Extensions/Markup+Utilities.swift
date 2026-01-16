//
//  Markup+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 16/01/26.
//

import Markdown

public extension Markup {
    func child<T: Markup>(through indices: Int..., as _: T.Type) -> T? {
        child(through: indices) as? T
    }
}
