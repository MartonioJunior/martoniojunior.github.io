//
//  ExpressibleByMarkdownPage.swift
//  Website
//
//  Created by Martônio Júnior on 15/10/2025.
//

// TODO: Mover este tipo para um módulo dedicado ao processamento Markdown para HTML
public protocol ExpressibleByMarkdownPage {
    associatedtype Metadata: Decodable
}
