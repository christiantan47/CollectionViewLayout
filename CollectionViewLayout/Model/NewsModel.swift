//
//  NewsModel.swift
//  CollectionViewLayout
//
//  Created by Tan Christian on 22/04/19.
//  Copyright © 2019 Tan Christian. All rights reserved.
//

import Foundation

struct NewsModel: Codable {
    let status, copyright, section: String
    let lastUpdated: String
    let numResults: Int
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case status, copyright, section
        case lastUpdated = "last_updated"
        case numResults = "num_results"
        case results
    }
}

struct Result: Codable {
    let section, subsection, title, abstract: String
    let url: String
    let byline: String
    let itemType: ItemType
    let updatedDate, createdDate, publishedDate: String
    let materialTypeFacet, kicker: String
    let desFacet, orgFacet, perFacet, geoFacet: [String]
    let multimedia: [Multimedia]
    let shortURL: String
    
    enum CodingKeys: String, CodingKey {
        case section, subsection, title, abstract, url, byline
        case itemType = "item_type"
        case updatedDate = "updated_date"
        case createdDate = "created_date"
        case publishedDate = "published_date"
        case materialTypeFacet = "material_type_facet"
        case kicker
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case multimedia
        case shortURL = "short_url"
    }
}

enum ItemType: String, Codable {
    case article = "Article"
}

struct Multimedia: Codable {
    let url: String
    let format: Format
    let height, width: Int
    let type: TypeEnum
    let subtype: Subtype
    let caption, copyright: String
}

enum Format: String, Codable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case normal = "Normal"
    case standardThumbnail = "Standard Thumbnail"
    case superJumbo = "superJumbo"
    case thumbLarge = "thumbLarge"
}

enum Subtype: String, Codable {
    case photo = "photo"
}

enum TypeEnum: String, Codable {
    case image = "image"
}
