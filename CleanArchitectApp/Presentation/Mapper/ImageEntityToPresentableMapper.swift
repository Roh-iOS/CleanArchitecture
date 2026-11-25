//
//  ImageEntityToPresentableMapper.swift
//  CleanArchitectApp
//
//  Created by Rohith on 23/11/26.
//

import Foundation

struct ImageEntityToPresentableMapper {
    
    static func toSearchListImage(from image: ImageEntity) -> SearchListImage {
        .init(
            id: image.id,
            url: URL(string: image.urls.thumb)!,
            likes: image.likes > 0 ? "\(image.likes)" : nil)
    }
}
