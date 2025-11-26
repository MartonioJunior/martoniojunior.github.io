//
//  WriteRSSFeed.swift
//  Website
//
//  Created by Martônio Júnior on 20/10/2025.
//

import Models
import RSS

public extension ArtsBlueprintsCodeWebsite {
    func writeRSSFeed() {
        let channel = RSSFeedChannel(
            title: name,
            // link: url,
            description: description,
        )

        let feed = RSSFeed(channel: channel)
    }
}
