//
//  Assets.swift
//  Website
//
//  Created by Martônio Júnior on 09/09/2025.
// 

import Foundation

public let artsBlueprintsCodeBundle = Bundle.module

public func generatePaths(forResourcesWithExtension: String, subdirectory: String? = nil) -> [String] {
    let urls = artsBlueprintsCodeBundle.urls(forResourcesWithExtension: "css", subdirectory: nil) ?? []
    print(urls)
    return urls.map {
        "Resources/EnergyTheme/\($0.relativeString)"
    }
}
