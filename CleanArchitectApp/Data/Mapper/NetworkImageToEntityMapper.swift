//
//  NetworkImageToEntityMapper.swift
//  CleanArchitectApp
//
//  Created by Rohith on 20/11/26.
//



import Foundation

struct NetworkImageToEntityMapper {
    func entity(from dto: NetworkImagesDTO) -> ImageEntity {
        .init(id: dto.id,
              description: dto.description,
              urls: .init(thumb: dto.urls.thumb, full: dto.urls.full),
              createdAt: dto.createdAt,
              likes: dto.likes)
    }
}
