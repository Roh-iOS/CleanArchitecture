//
//  FetchImagesUseCase.swift
//  CleanArchitectApp
//
//  Created by Rohith on 16/11/26.
//

import Foundation

protocol FetchImagesUseCase {
    func fetchImages(query: String) async throws -> SearchImagesResult
}

struct FetchImagesUseCaseImpl: FetchImagesUseCase {
    private let repository: ImageRepository
    
    init(repository: ImageRepository) {
        self.repository = repository
    }
    
    func fetchImages(query: String) async throws -> SearchImagesResult {
        try await repository.searchImages(query: query)
    }
}
