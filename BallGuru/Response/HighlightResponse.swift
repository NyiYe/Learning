//
//  HighlightResponse.swift
//  BallGuru
//
//  Created by Barry on 11/09/2023.
//

import Foundation

// MARK: - HighlightResponse
struct HighlightResponse: Codable {
    let kind, etag, nextPageToken: String?
    @Ignore
    var items: [DataItem]? = []
    @Ignore
    var pageInfo: PageInfo? = nil
}

// MARK: - Item
struct DataItem: Codable , Identifiable {
    var id : String = UUID().uuidString
    @Ignore
    var kind: String? = nil
    let etag :String
    let snippet: Snippet
}

//enum ItemKind: String, Codable {
//
//    case youtubePlaylistItem = "youtube#playlistItem"
//}

// MARK: - Snippet
struct Snippet: Codable ,Identifiable {
    var id = UUID().uuidString
    @Ignore
    var publishedAt: String?
    let channelID: ChannelID
    let title, description: String
    let thumbnails: Thumbnails
    let channelTitle: ChannelTitle
    let playlistID: PlaylistID
    let position: Int
    let resourceID: ResourceID
    let videoOwnerChannelTitle, videoOwnerChannelID: String?
    

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title, description, thumbnails, channelTitle
        case playlistID = "playlistId"
        case position
        case resourceID = "resourceId"
        case videoOwnerChannelTitle
        case videoOwnerChannelID = "videoOwnerChannelId"
    }
}

enum ChannelID: String, Codable {
    case ucg5QGWdu8NIRZqJGgDWQW = "UCG5qGWdu8nIRZqJ_GgDwQ-w"
}

enum ChannelTitle: String, Codable {
    case premierLeague = "Premier League"
}

enum PlaylistID: String, Codable {
    case plqVoP4Q3CffZYz6SVkSigiLFAZI5VBA = "PLQ_voP4Q3cffZYz6sVkSigiLfAZI_5vba"
}

// MARK: - ResourceID
struct ResourceID: Codable {
    let kind: ResourceIDKind
    let videoID: String

    enum CodingKeys: String, CodingKey {
        case kind
        case videoID = "videoId"
    }
}

enum ResourceIDKind: String, Codable {
    case youtubeVideo = "youtube#video"
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high, standard: Default?
    let maxres: Default?

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high, standard, maxres
    }
}

// MARK: - Default
struct Default: Codable {
    let url: String
    let width, height: Int
}

// MARK: - PageInfo
struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int
}
