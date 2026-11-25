//
//  ImageEntity.swift
//  CleanArchitectApp
//
//  Created by Rohith on 16/11/26.
//

import Foundation

struct ImageEntity {
    let id: String
    let description: String
    let urls: ImageUrls
    let createdAt: String
    let likes: Int
    
    struct ImageUrls {
        let thumb: String
        let full: String
    }
    
}

