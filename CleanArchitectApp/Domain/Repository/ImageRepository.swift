//
//  ImageRepository.swift
//  CleanArchitectApp
//
//  Created by Rohith on 17/11/26.
//

import Foundation

protocol ImageRepository {
    func searchImages(query: String) async throws -> SearchImagesResult
}
