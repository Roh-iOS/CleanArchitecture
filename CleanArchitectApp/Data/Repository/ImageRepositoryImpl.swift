//
//  ImageRepositoryImpl.swift
//  CleanArchitectApp
//
//  Created by Rohith on 17/11/26.
//

import Foundation

class ImageRepositoryImpl {
    private let dataSource: ImageDataSource
    
    init(dataSource: ImageDataSource) {
        self.dataSource = dataSource
    }
}

extension ImageRepositoryImpl: ImageRepository {
    func searchImages(query: String) async throws -> SearchImagesResult {
        do{
            let searchResponse = try await dataSource.searchImages(query: query)
            let mapper = NetworkImageToEntityMapper()
            return.init(total: searchResponse.total,
                        totalPages: searchResponse.totalPages,
                        images: searchResponse.images.map { mapper.entity(from: $0)}
            )
        } catch {
            throw error
        }
    }
}
