//
//  SearchImageResponse.swift
//  CleanArchitectApp
//
//  Created by Rohith on 20/11/26.
//

import Foundation

struct SearchImageResponse: Decodable {
    let total: Int
    let totalPages: Int
    let images: [NetworkImagesDTO]
    
    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case images = "results"
    }
}

