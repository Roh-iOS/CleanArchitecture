//
//  CleanArchitectAppApp.swift
//  CleanArchitectApp
//
//  Created by Rohith on 16/11/26.
//

import SwiftUI

@main
struct CleanArchitectAppApp: App {
    var body: some Scene {
        WindowGroup {
            SearchImagesView(viewModel: SearchImageStoreImplementation(fetchImagesUseCase: FetchImagesUseCaseImpl(
                repository: ImageRepositoryImpl(
                    dataSource: ImagesDataSourceImpl()
                )
            )
            )
            )
        }
    }
}
