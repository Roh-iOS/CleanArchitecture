//
//  ImageDataSource.swift
//  CleanArchitectApp
//
//  Created by Rohith on 17/11/26.
//

import Foundation

protocol ImageDataSource {
    func searchImages(query: String) async throws -> SearchImageResponse
}



class ImagesDataSourceImpl { }

extension ImagesDataSourceImpl: ImageDataSource {
    func searchImages(query: String) async throws -> SearchImageResponse {
       let url = "https://api.unsplash.com/search/photos?query=\(query)&client_id=iNVwq_dDllYTt5JPlKL-xsdLjPseQseely8dGEBGZb8"
        let(data, _) = try await URLSession.shared.data(from: URL(string: url)!)
        
        let searchResponse = try JSONDecoder().decode(
            SearchImageResponse.self,
            from: data
        )
        return searchResponse
    }
}



// https://api.unsplash.com/search/photos?query=cats&client_id=iNVwq_dDllYTt5JPlKL-xsdLjPseQseely8dGEBGZb8
