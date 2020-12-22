//
//  Models.swift
//  FileParsingJSON
//
//  Created by 김호준 on 2020/12/21.
//

import Foundation

struct Result: Codable {
    let data: [ResultItem]
}

struct ResultItem: Codable {
    let title: String
    let items: [String]
}
