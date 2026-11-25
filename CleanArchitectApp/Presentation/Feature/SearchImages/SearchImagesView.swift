//
//  SearchImagesView.swift
//  CleanArchitectApp
//
//  Created by Rohith on 16/11/26.
//

import SwiftUI

struct SearchImagesView<VM: SearchImageStore>: View {
    
    @ObservedObject var viewModel: VM
     
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                SearchBar(text: $viewModel.query, onSearchButtonClicked: {
                    viewModel.fetchImages()
                })
                .padding(.horizontal)
                
                // Images Grid
                GeometryReader { geometry in
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(viewModel.images) { image in
                                ZStack(alignment: .bottomTrailing) {
                                    AsyncImage(url: image.url) { imagePhase in
                                        switch imagePhase {
                                        case .empty:
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(Color.gray.opacity(0.3))
                                                .aspectRatio(3/4 ,contentMode: .fill)
                                                .overlay(ProgressView())
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .frame(maxHeight: .infinity)
                                                .frame(maxWidth: (geometry.size.width - 32) / 3)
                                                .aspectRatio(3/4 ,contentMode: .fill)
                                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                                .clipped()
                                        case .failure(_):
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(Color.gray.opacity(0.3))
                                                .aspectRatio(3/4 ,contentMode: .fill)
                                                .overlay(Image(systemName: "photo")
                                                    .foregroundColor(.gray))
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    
                                    if let likes = image.likes, likes.isEmpty {
                                        HStack {
                                            Text(likes)
                                                .foregroundStyle(.white)
                                            Image(systemName: "heart.fill")
                                                .foregroundStyle(.white)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("Image Gallery")
        }
    }
}

struct SearchBar: View{
    @Binding var text: String
    let onSearchButtonClicked: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search Images...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onSubmit {
                    onSearchButtonClicked()
                }
            
            Button("Search") {
                onSearchButtonClicked()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    SearchImagesView(viewModel: SearchImageStoreImplementation(fetchImagesUseCase: FetchImagesUseCaseImpl(
        repository: ImageRepositoryImpl(
            dataSource: ImagesDataSourceImpl()
        )
    )
    )
    )
}
