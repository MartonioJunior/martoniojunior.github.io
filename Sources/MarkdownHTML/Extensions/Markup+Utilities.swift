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
    
    func onlyChildren<T: Markup>(ofType _: T.Type) -> [T] {
        (0..<childCount).compactMap { child(through: $0, as: T.self) }
    }
}
