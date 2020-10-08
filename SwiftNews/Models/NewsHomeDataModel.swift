//
//  NewsHomeDataModel.swift
//  SwiftNews
//
//  Created by Adebayo  Ogunmuyiwa on 2020-10-07.
//


import Foundation


//let NewsListApiKey = "https://www.reddit.com/r/swift/.json"
let NewsListApiKey = "https://www.d.com/r/swift/.json"


//
//   let newsHomeDataModel = try? newJSONDecoder().decode(NewsHomeDataModel.self, from: jsonData)

import Foundation

// MARK: - NewsHomeDataModel
struct NewsHomeDataModel: Codable {
    let data: NewsHomeDataModelData?
}

// MARK: - NewsHomeDataModelData
struct NewsHomeDataModelData: Codable {
    let children: [Child]?
}

// MARK: - Child
struct Child: Codable {
    let data: ChildData?
}

// MARK: - ChildData
struct ChildData: Codable {
    let selftext, authorFullname: String?
    let title: String?
    let thumbnailHeight: Int?
    let thumbnailWidth: Int?
    let thumbnail: String?
   
   
   

    enum CodingKeys: String, CodingKey {
        case selftext
        case authorFullname = "author_fullname"
        case title
        case thumbnailHeight = "thumbnail_height"
        case thumbnailWidth = "thumbnail_width"
        case thumbnail
    }
}





