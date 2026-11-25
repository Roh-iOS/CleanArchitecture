//
//  SearchImageStore.swift
//  CleanArchitectApp
//
//  Created by Rohith on 16/11/26.
//

import Foundation
import Combine

protocol SearchImageStore: ObservableObject {
    var query: String { get set }
    var images: [SearchListImage] { get set }
    
    func fetchImages()
}

@MainActor
class SearchImageStoreImplementation: SearchImageStore {
    @Published var query: String = ""
    @Published var images: [SearchListImage] = []
    
    private let fetchImagesUseCase: FetchImagesUseCase
    private var currentPage = 0
    private var totalPages = 0
    
    
    init(fetchImagesUseCase: FetchImagesUseCase) {
        self.fetchImagesUseCase = fetchImagesUseCase
    }
    
    func fetchImages() {
        Task { [weak self] in
            guard let self = self else {return}
            do {
                // call the usecase and fetch the images
                let searchResult = try await fetchImagesUseCase.fetchImages(query: query)
                self.totalPages = searchResult.totalPages
                
                // map the ImageEntity into Presentable objects
                let searchListImages = searchResult.images.map {
                    ImageEntityToPresentableMapper.toSearchListImage(from: $0)}
                
                // update the @Published variable to refresh the UI
                self.images.append(contentsOf: searchListImages)
                debugPrint(searchResult)
            } catch {
                debugPrint(error)
            }
        }
    }
}
