//
//  NetworkImages.swift
//  CleanArchitectApp
//
//  Created by Rohith on 20/11/26.
//

import Foundation

struct NetworkImagesDTO: Decodable {
    let id: String
    let description: String
    let urls: ImageUrls
    let createdAt: String
    let likes: Int
    
    struct ImageUrls: Decodable {
        let thumb: String
        let full: String
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case description = "alt_description"
        case urls
        case createdAt = "created_at"
        case likes
    }
}
