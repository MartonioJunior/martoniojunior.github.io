
//
//  GeneralWebsiteConfiguration.swift
//  Website
//
//  Created by Martônio Júnior on 17/01/2026.
//

import Markdown

// MARK: Markdown.HTML.Configuration
//public extension Markdown.HTML.Configuration {
//    static var website: Self { .init(elements: .website) }
//}

// MARK: Markdown.HTML.Configuration.Elements
//public extension Markdown.HTML.Configuration.Elements {
//    static var website: Self {
//        .init(
//            heading: .init { input in
//                ContentDivision {
//                    tag("h\(input.level)") {
//                        input.children
//                    }
//                }
//            },
//            codeBlock: .init { input in
//                PreformattedText {
//                    Code {
//                        HTML.Text(input.code)
//                    }
//                }
//            },
//            blockQuote: .init { input in
//                HTML_Rendering.BlockQuote {
//                    input.children
//                }
//            },
//            paragraph: .init { input in
//                HTML_Rendering.Paragraph {
//                    input.children
//                }
//            },
//            image: .default,
//            link: .default,
//            orderedList: .init { input in
//                OrderedList {
//                    input.children
//                }
//            },
//            unorderedList: .init { input in 
//                UnorderedList {
//                    input.children
//                }
//            },
//            listItem: .init { input in
//                HTML_Rendering.ListItem {
//                    input.children
//                }
//            },
//            table: .default,
//            thematicBreak: .default,
//            emphasis: .default,
//            strong: .default,
//            strikethrough: .default,
//            inlineCode: .default,
//            text: .default,
//            lineBreak: .default,
//            softBreak: .default
//        )
//    }
//}
