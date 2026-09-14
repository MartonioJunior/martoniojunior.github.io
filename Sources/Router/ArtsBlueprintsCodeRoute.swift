//
//  ArtsBlueprintsCodeRoute.swift
//  Website
//
//  Created by Martônio Júnior on 14/01/2026.
//

import Models

/// Router for the Arts, Blueprints, Code! website.
public enum ArtsBlueprintsCodeRoute {
    /// Route for accessing the home page.
    case home
    /// Route for accessing a post.
    case post(Post)
    /// Route for accessing a project.
    case project(Project)
    /// Route for accessing a section of the website.
    case section(Section)
}
