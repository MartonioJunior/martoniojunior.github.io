//
//  Publish+Assets.swift
//  Website
//
//  Created by Martônio Júnior on 09/09/2025.
//

import Assets
import Publish

public extension Array where Element == Path {
    static var cssFiles: Self {
        generatePaths(forResourcesWithExtension: "css").map(Path.init)
    }

    static var fontFiles: Self {
        generatePaths(forResourcesWithExtension: "otf").map(Path.init)
    }
}
