//
//  NewsResponse.swift
//  BallGuru
//
//  Created by Barry on 08/09/2023.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {

    let status: String
    let totalResults: Int
    let results: [News]
    let nextPage: String
}

// MARK: - Result
struct News: Codable,Identifiable {
    @Ignore
    var id : UUID? = UUID()
    let articleID, title: String
    let link: String
    let keywords: [String]
    let creator: [String]?
    let videoURL: String?
    let description, content, pubDate: String
    let image: String?
    let sourceID: String
    let sourcePriority: Int
    let country: [Country]
    let category: [Category]
    let language: Language
    var imageURL : URL? {
        if let image = image{
         return  URL(string: image)
        }
        return nil
    }

    enum CodingKeys: String, CodingKey {
        case articleID = "article_id"
        case title, link, keywords, creator
        case videoURL = "video_url"
        case description, content, pubDate
        case image = "image_url"
        case sourceID = "source_id"
        case sourcePriority = "source_priority"
        case country, category, language
    }
}

enum Category: String, Codable {
    case business = "business"
    case environment = "environment"
    case top = "top"
}

enum Country: String, Codable {
    case myanmar = "myanmar"
}

enum Language: String, Codable {
    case burmese = "burmese"
    case english = "english"
}
