//
//  MusicItems.swift
//  URLSession Practice
//
//  Created by 김호준 on 2020/08/11.
//  Copyright © 2020 김호준. All rights reserved.
//

import Foundation


struct MusicItems: Codable {
    var results: [Items]
}

struct Items: Codable, Identifiable {
    let id: Int
    let artistName: String
    let trackName: String
    let collectionName: String
    let previewUrl: String
    let artwork: String
    
    enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case artistName
        case trackName
        case collectionName
        case previewUrl
        case artwork = "artworkUrl100"
    }
}
