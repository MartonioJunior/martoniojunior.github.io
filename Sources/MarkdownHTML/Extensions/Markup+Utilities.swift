//
//  Markup+Utilities.swift
//  Website
//
//  Created by Martônio Júnior on 16/01/26.
//

import Markdown

public extension Markup {
    /// Traverse this markup tree by descending into the child `T` at the index of each path element
    /// - Parameters:
    ///   - indices: List of indices to check.
    ///
    /// - Returns: Markup element as type `T`.
    func child<T: Markup>(through indices: Int..., as _: T.Type) -> T? {
        // swiftlint:disable:previous prefer_self_in_static_references
        child(through: indices) as? T
    }
    /// Obtains all children elements that are of type `T`.
    /// - Returns: List of children of type `T`.
    func onlyChildren<T: Markup>(ofType _: T.Type) -> [T] {
        // swiftlint:disable:previous prefer_self_in_static_references
        (0..<childCount).compactMap { child(through: $0, as: T.self) }
    }
}
